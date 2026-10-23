t = linspace(-1, 1, 4000);
H_values = [1, 3, 9, 25];

figure('Position', [100, 100, 1000, 800]);

for i = 1:length(H_values)
    H = H_values(i);
    x = zeros(size(t));

    for k = 1:2:H
        x = x + (4/pi) * sin(2*pi*k*t) / k;
    end

    subplot(2, 2, i);
    plot(t, x, 'LineWidth', 1.2);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title(['Square Wave Approximation (H = ', num2str(H), ')']);
    ylim([-1.5, 1.5]);
end

saveas(gcf, '../exercise-1/square-wave-comparison.png');
