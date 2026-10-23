d = 6;
f2 = 13.2 + 0.17*d;
fs = 200;

figure('Position', [100, 100, 1200, 400]);

T1 = 1;
t1 = 0:1/fs:T1-1/fs;
x1 = 0.8*sin(2*pi*15*t1) + 0.4*sin(2*pi*f2*t1);
N1 = length(x1);
Y1 = fft(x1);
P1_1 = abs(Y1/N1); P1_1 = P1_1(1:N1/2+1); P1_1(2:end-1) = 2*P1_1(2:end-1);
f1 = fs*(0:N1/2)/N1;

subplot(1, 3, 1);
plot(f1, P1_1, 'LineWidth', 1.2); grid on;
title('1-second recording'); xlabel('Frequency (Hz)'); ylabel('Amplitude');

T2 = 4;
t2 = 0:1/fs:T2-1/fs;
x2 = 0.8*sin(2*pi*15*t2) + 0.4*sin(2*pi*f2*t2);
N2 = length(x2);
Y2 = fft(x2);
P1_2 = abs(Y2/N2); P1_2 = P1_2(1:N2/2+1); P1_2(2:end-1) = 2*P1_2(2:end-1);
f2_axis = fs*(0:N2/2)/N2;

subplot(1, 3, 2);
plot(f2_axis, P1_2, 'LineWidth', 1.2); grid on;
title('4-second recording'); xlabel('Frequency (Hz)'); ylabel('Amplitude');

% 3. Zero-padding (1 секунда, 4*N1)
Y3 = fft(x1, 4*N1);
P1_3 = abs(Y3/(N1)); 
P1_3 = P1_3(1:2*N1+1); P1_3(2:end-1) = 2*P1_3(2:end-1);
f3 = fs*(0:2*N1)/(4*N1);

subplot(1, 3, 3);
plot(f3, P1_3, 'LineWidth', 1.2); grid on;
title('1-sec with Zero-padding (4x N)'); xlabel('Frequency (Hz)'); ylabel('Amplitude');

saveas(gcf, '../exercise-3/leakage-comparison.png');
