%% Lecture01_signal_visualization.m
% Assignment: Create, visualize, and interpret simple signals in MATLAB
% Author: Arsenii
% Description: This script generates sine waves, compares frequencies
% and amplitudes, adds noise, and saves the resulting figures as PNG files.

clear; clc; close all;

%% ------------------------------------------------------------------
%% Task 1: Create a Sine Wave
%% ------------------------------------------------------------------

A = 1;              % Amplitude
f = 5;               % Frequency in Hz
duration = 1;         % Duration in seconds
Fs = 1000;            % Sampling frequency (samples per second)

t = 0:1/Fs:duration;  % Time vector

y = A * sin(2*pi*f*t); % Sine wave equation

figure('Name', 'Task 1 - Basic Sine Wave');
plot(t, y, 'b', 'LineWidth', 1.5);
title('Sine Wave: Amplitude = 1, Frequency = 5 Hz');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% ------------------------------------------------------------------
%% Task 2: Compare Different Frequencies
%% ------------------------------------------------------------------

f1 = 2;   % Hz
f2 = 5;   % Hz
f3 = 10;  % Hz

y1 = A * sin(2*pi*f1*t);
y2 = A * sin(2*pi*f2*t);
y3 = A * sin(2*pi*f3*t);

figure('Name', 'Task 2 - Frequency Comparison');

subplot(3,1,1);
plot(t, y1, 'r', 'LineWidth', 1.2);
title('Frequency = 2 Hz');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
plot(t, y2, 'g', 'LineWidth', 1.2);
title('Frequency = 5 Hz');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3,1,3);
plot(t, y3, 'b', 'LineWidth', 1.2);
title('Frequency = 10 Hz');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

sgtitle('Frequency Comparison: 2 Hz vs 5 Hz vs 10 Hz');

% Save this figure as required in Task 5
saveas(gcf, 'frequency_comparison.png');

%% ------------------------------------------------------------------
%% Task 3: Compare Different Amplitudes
%% ------------------------------------------------------------------

f_const = 5; % Same frequency for all three signals

A1 = 0.5;
A2 = 1;
A3 = 2;

ya1 = A1 * sin(2*pi*f_const*t);
ya2 = A2 * sin(2*pi*f_const*t);
ya3 = A3 * sin(2*pi*f_const*t);

figure('Name', 'Task 3 - Amplitude Comparison');

subplot(3,1,1);
plot(t, ya1, 'r', 'LineWidth', 1.2);
title('Amplitude = 0.5');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
ylim([-2.5 2.5]); % Fixed y-axis so amplitude differences are visible

subplot(3,1,2);
plot(t, ya2, 'g', 'LineWidth', 1.2);
title('Amplitude = 1');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
ylim([-2.5 2.5]);

subplot(3,1,3);
plot(t, ya3, 'b', 'LineWidth', 1.2);
title('Amplitude = 2');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
ylim([-2.5 2.5]);

sgtitle('Amplitude Comparison: 0.5 vs 1 vs 2 (Frequency = 5 Hz)');

% Save this figure as required in Task 5
saveas(gcf, 'amplitude_comparison.png');

%% ------------------------------------------------------------------
%% Task 4: Add Noise
%% ------------------------------------------------------------------

f_clean = 5;
y_clean = A * sin(2*pi*f_clean*t);

noise_level = 0.3;                     % Controls how strong the noise is
noise = noise_level * randn(size(t));  % Gaussian (random) noise
y_noisy = y_clean + noise;

figure('Name', 'Task 4 - Clean vs Noisy Signal');

subplot(2,1,1);
plot(t, y_clean, 'b', 'LineWidth', 1.5);
title('Clean Signal (5 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(t, y_noisy, 'r', 'LineWidth', 1);
title('Noisy Signal (5 Hz + Random Noise)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

sgtitle('Clean Signal vs Noisy Signal');

% Save this figure as required in Task 5
saveas(gcf, 'clean_vs_noisy_signal.png');

%% ------------------------------------------------------------------
%% End of script
%% ------------------------------------------------------------------
disp('All figures generated and saved successfully.');
