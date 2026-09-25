clear; close all; clc;

%% General Parameters
f_signal = 10;          % Signal frequency: 10 Hz
duration = 1;           % Duration: 1 second
amplitude = 1;          % Signal amplitude

% High sampling rate to simulate a continuous-time signal
fs_continuous = 10000;  
t_cont = 0:1/fs_continuous:duration;
x_cont = amplitude * sin(2 * pi * f_signal * t_cont);

%% Task 1: Create and Save Original Signal
figure('Color', 'white', 'Position', [100, 100, 800, 400]);
plot(t_cont, x_cont, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Continuous Signal (10 Hz)');
title('Original Continuous Signal (10 Hz Sine Wave)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;
legend('Location', 'northeast');
xlim([0 duration]);
ylim([-1.2 1.2]);

% Save Figure 1
saveas(gcf, 'original_signal.png');

%% Task 2: Investigate Different Sampling Frequencies
fs_list = [15, 20, 25, 50, 100];

% Figure with 5 subplots (Recommended)
figure('Color', 'white', 'Position', [100, 100, 1000, 1000]);

for i = 1:length(fs_list)
    fs_sample = fs_list(i);

    % Discrete sampling points
    t_sample = 0 : 1/fs_sample : duration;
    x_sample = amplitude * sin(2 * pi * f_signal * t_sample);

    % Plot in main combined figure
    subplot(5, 1, i);
    plot(t_cont, x_cont, 'b--', 'LineWidth', 1, 'DisplayName', 'Original (10 Hz)');
    hold on;
    stem(t_sample, x_sample, 'r', 'LineWidth', 1.2, 'MarkerFaceColor', 'r', 'DisplayName', sprintf('Sampled (%d Hz)', fs_sample));
    plot(t_sample, x_sample, 'r:', 'LineWidth', 1, 'HandleVisibility', 'off'); % Connect samples
    hold off;

    title(sprintf('Sampling Frequency: f_s = %d Hz', fs_sample));
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
    legend('Location', 'northeast');
    xlim([0 duration]);
    ylim([-1.2 1.2]);

    % Save separate figures for repository requirement
    fig_sep = figure('Visible', 'off', 'Color', 'white', 'Position', [100, 100, 800, 400]);
    plot(t_cont, x_cont, 'b--', 'LineWidth', 1.2, 'DisplayName', 'Original Signal (10 Hz)');
    hold on;
    stem(t_sample, x_sample, 'r', 'LineWidth', 1.5, 'MarkerFaceColor', 'r', 'DisplayName', sprintf('Sampled Signal (%d Hz)', fs_sample));
    plot(t_sample, x_sample, 'r:', 'LineWidth', 1);
    hold off;

    title(sprintf('Signal Sampled at f_s = %d Hz', fs_sample));
    xlabel('Time (seconds)');
    ylabel('Amplitude');
    grid on;
    legend('Location', 'northeast');
    xlim([0 duration]);
    ylim([-1.2 1.2]);

    filename = sprintf('sampling_%dHz.png', fs_sample);
    saveas(fig_sep, filename);
    close(fig_sep);
end

disp('All figures have been generated and saved successfully.');
