clear;
close all;
clc;

% Use the same random noise each time
rng(1);

%% Create a clean discrete-time signal
n = 0:100;
clean = sin(0.1*pi*n);

%% Add noise
noise = 0.4*randn(size(n));
measured = clean + noise;

%% Task 1: Amplitude Scaling (Figure 1 -> signal_operations.png)
scaled = 2 * measured;

figure(1);
plot(n, measured, 'Color', [0.6 0.6 0.6], 'LineWidth', 1.2);
hold on;
plot(n, scaled, 'r', 'LineWidth', 1.5);
grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Task 1: Amplitude Scaling (2x Multiplier)');
legend('Noisy Signal', 'Scaled Signal (2x)');

saveas(gcf, 'signal_operations.png');

%% Task 2: Signal Delay (В том же Figure 1 или консольно, без лишних сохранений)
delay = 5;
delayed = [zeros(1, delay), measured];

%% Task 3: Five-Point Moving-Average Filter (Figure 2 -> noise_filtering.png)
h5 = ones(1, 5) / 5;
filtered5 = conv(measured, h5, 'same');

figure(2);
plot(n, clean, 'b', 'LineWidth', 1.5);
hold on;
plot(n, measured, 'Color', [0.6 0.6 0.6], 'LineWidth', 1);
plot(n, filtered5, 'g', 'LineWidth', 1.5);
grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Task 3: 5-Point Moving-Average Filter');
legend('Clean Signal', 'Noisy Signal', '5-Point Filtered Signal');

saveas(gcf, 'noise_filtering.png');

%% Task 4: Compare Two Filter Lengths (Figure 3 -> filter_comparison.png)
h15 = ones(1, 15) / 15;
filtered15 = conv(measured, h15, 'same');

figure(3);
plot(n, clean, 'b-', 'LineWidth', 1.5);
hold on;
plot(n, measured, 'Color', [0.7 0.7 0.7], 'LineWidth', 0.8);
plot(n, filtered5, 'g--', 'LineWidth', 1.5);
plot(n, filtered15, 'r-.', 'LineWidth', 1.8);
grid on;
xlabel('Sample index n');
ylabel('Amplitude');
title('Task 4: Comparison of 5-Point and 15-Point Filters');
legend('Clean Signal', 'Noisy Signal', '5-Point Filtered', '15-Point Filtered');

saveas(gcf, 'filter_comparison.png');
