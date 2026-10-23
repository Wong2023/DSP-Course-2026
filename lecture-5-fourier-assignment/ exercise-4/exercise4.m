x = [1 1 1 1];
n = 0:length(x)-1;

% 1. DTFT 
w = linspace(-pi, pi, 1000);
X_dtft = x * exp(-1j * (n.' * w));

% 2. DFT
X_dft4 = fft(x, 4);
w4 = (0:3)*2*pi/4; w4(w4 > pi) = w4(w4 > pi) - 2*pi; [w4, idx4] = sort(w4);

X_dft64 = fft(x, 64);
w64 = (0:63)*2*pi/64; w64(w64 > pi) = w64(w64 > pi) - 2*pi; [w64, idx64] = sort(w64);

% diargamm
figure('Position', [100, 100, 800, 500]);
plot(w, abs(X_dtft), 'r', 'LineWidth', 1.5, 'DisplayName', 'DTFT (continuous)'); hold on;
stem(w4, abs(X_dft4(idx4)), 'bo', 'LineWidth', 1.2, 'DisplayName', 'DFT N=4');
stem(w64, abs(X_dft64(idx64)), 'g.', 'LineWidth', 1.2, 'DisplayName', 'DFT N=64');
grid on;
xlabel('Angular frequency (rad/sample)');
ylabel('Magnitude');
title('DTFT vs DFT Comparison');
legend('Location', 'northeast');

saveas(gcf, '../exercise-4/dtft-dft-comparison.png');
