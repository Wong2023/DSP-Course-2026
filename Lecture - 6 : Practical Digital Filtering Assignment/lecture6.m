%% Assignment: Practical Digital Filtering
% Course: Digital Signal Processing (IT00BD97-3001)
% Author: Arsenii Marchenko
% MATLAB Version: R2026a (Signal Processing Toolbox required)

clear; clc; close all;

%% =========================================================================
%% PART A: Sensor Signal Filtering
%% =========================================================================

% 1. Signal Generation
Fs = 1000;                      % Sampling frequency (Hz)
t = (0:1/Fs:2-1/Fs)';          % Time vector (2 seconds)
rng(7);                         % Fixed seed for reproducibility

clean = sin(2*pi*5*t) + 0.35*sin(2*pi*12*t);
noise = 0.35*sin(2*pi*50*t) + 0.20*sin(2*pi*137*t) + 0.25*randn(size(t));
x = clean + noise;

% 2. Filter Design & Zero-Phase Filtering
fc = 20;                        % Cutoff frequency (Hz)
Wn = fc / (Fs/2);               % Normalized cutoff frequency

% FIR Filter: Order 60 (61 taps)
bFIR = fir1(60, Wn, 'low');
yFIR = filtfilt(bFIR, 1, x);

% IIR Filter: 4th-order Butterworth
[bIIR, aIIR] = butter(4, Wn, 'low');
yIIR = filtfilt(bIIR, aIIR, x);

% 3. Calculate RMSE
rmse_noisy = sqrt(mean((x - clean).^2));
rmse_FIR   = sqrt(mean((yFIR - clean).^2));
rmse_IIR   = sqrt(mean((yIIR - clean).^2));

fprintf('--- PART A: RMSE Results ---\n');
fprintf('Noisy Signal RMSE: %.4f\n', rmse_noisy);
fprintf('FIR Output RMSE:   %.4f\n', rmse_FIR);
fprintf('IIR Output RMSE:   %.4f\n\n', rmse_IIR);

% --- Figure 1: Sensor Time-Domain Comparison (Short 0.2s section) ---
figure('Name', 'Part A - Time Domain', 'NumberTitle', 'off');
idx = t <= 0.2;
plot(t(idx), clean(idx), 'k--', 'LineWidth', 1.5); hold on;
plot(t(idx), x(idx), 'Color', [0.7 0.7 0.7], 'LineWidth', 1);
plot(t(idx), yFIR(idx), 'b-', 'LineWidth', 1.2);
plot(t(idx), yIIR(idx), 'r-.', 'LineWidth', 1.2);
hold off;
grid on;
xlabel('Time (s)'); ylabel('Amplitude');
title('Sensor Signal: Time-Domain Comparison (0 to 0.2 s)');
legend('Clean Signal', 'Noisy Input', 'FIR (Order 60)', 'IIR Butterworth (Order 4)', 'Location', 'northeast');

% --- Figure 2: Sensor Magnitude Responses ---
figure('Name', 'Part A - Frequency Response', 'NumberTitle', 'off');
[hFIR, fFIR] = freqz(bFIR, 1, 1024, Fs);
[hIIR, fIIR] = freqz(bIIR, aIIR, 1024, Fs);

plot(fFIR, 20*log10(abs(hFIR)), 'b', 'LineWidth', 1.5); hold on;
plot(fIIR, 20*log10(abs(hIIR)), 'r--', 'LineWidth', 1.5);
xline(fc, 'k:', 'Cutoff (20 Hz)', 'LineWidth', 1.2, 'LabelOrientation', 'aligned');
hold off;
grid on;
xlim([0 200]); ylim([-80 5]);
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
title('Filter Magnitude Responses (freqz)');
legend('FIR (fir1, N=60)', 'IIR (butter, N=4)', 'Cutoff (20 Hz)');

% --- Figure 3: Single-Sided Amplitude Spectra ---
figure('Name', 'Part A - Spectra', 'NumberTitle', 'off');
N = length(t);
f_vec = (0:N/2-1)*(Fs/N);

X_fft    = abs(fft(x)/N);    X_mag    = X_fft(1:N/2);    X_mag(2:end-1)    = 2*X_mag(2:end-1);
Y_FIR_fft= abs(fft(yFIR)/N); Y_FIR_mag= Y_FIR_fft(1:N/2); Y_FIR_mag(2:end-1)= 2*Y_FIR_mag(2:end-1);
Y_IIR_fft= abs(fft(yIIR)/N); Y_IIR_mag= Y_IIR_fft(1:N/2); Y_IIR_mag(2:end-1)= 2*Y_IIR_mag(2:end-1);

subplot(3,1,1);
stem(f_vec, X_mag, 'Color', [0.4 0.4 0.4], 'Marker', 'none'); grid on; xlim([0 200]);
title('Spectrum: Noisy Input'); ylabel('Magnitude');

subplot(3,1,2);
stem(f_vec, Y_FIR_mag, 'b', 'Marker', 'none'); grid on; xlim([0 200]);
title('Spectrum: FIR Output'); ylabel('Magnitude');

subplot(3,1,3);
stem(f_vec, Y_IIR_mag, 'r', 'Marker', 'none'); grid on; xlim([0 200]);
title('Spectrum: IIR Output'); xlabel('Frequency (Hz)'); ylabel('Magnitude');


%% =========================================================================
%% PART B: Audio Hum Reduction (Handel Example)
%% =========================================================================

% 1. Load Audio and Add 50 Hz Hum
load handel;                      % Loads y and Fs
xClean = y(:);
tAudio = (0:numel(xClean)-1)'/Fs;
xHum = xClean + 0.15*sin(2*pi*50*tAudio);

% 2. Notch Filters Design (Narrow vs Wide)
% Narrow Notch: 49-51 Hz
[bN_narrow, aN_narrow] = butter(2, [49 51]/(Fs/2), 'stop');
yAudio_narrow = filtfilt(bN_narrow, aN_narrow, xHum);

% Wide Notch: 45-55 Hz
[bN_wide, aN_wide]     = butter(2, [45 55]/(Fs/2), 'stop');
yAudio_wide   = filtfilt(bN_wide, aN_wide, xHum);

% --- Figure 4: Audio Waveform Comparison ---
figure('Name', 'Part B - Audio Waveforms', 'NumberTitle', 'off');
idxA = (tAudio >= 1.0) & (tAudio <= 1.1); % 0.1s slice
plot(tAudio(idxA), xClean(idxA), 'k--', 'LineWidth', 1.2); hold on;
plot(tAudio(idxA), xHum(idxA), 'Color', [0.8 0.3 0.3], 'LineWidth', 1);
plot(tAudio(idxA), yAudio_narrow(idxA), 'b-', 'LineWidth', 1.2);
hold off; grid on;
xlabel('Time (s)'); ylabel('Amplitude');
title('Audio Waveform Segment (1.0 s to 1.1 s)');
legend('Clean Audio', 'Audio + 50Hz Hum', 'Filtered (Narrow Notch)');

% --- Figure 5: Audio Spectrogram Comparison ---
figure('Name', 'Part B - Spectrograms', 'NumberTitle', 'off');
subplot(3,1,1);
spectrogram(xClean, 256, 200, 1024, Fs, 'yaxis');
title('Spectrogram: Clean Handel Audio'); ylim([0 1]);

subplot(3,1,2);
spectrogram(xHum, 256, 200, 1024, Fs, 'yaxis');
title('Spectrogram: Audio + 50 Hz Hum'); ylim([0 1]);

subplot(3,1,3);
spectrogram(yAudio_narrow, 256, 200, 1024, Fs, 'yaxis');
title('Spectrogram: Filtered Audio (49-51 Hz Notch)'); ylim([0 1]);

% Optional playback commands (uncomment to listen during execution):
sound(xHum, Fs);
pause(8);
sound(yAudio_narrow, Fs);