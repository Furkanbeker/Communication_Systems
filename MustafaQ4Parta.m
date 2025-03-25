frequencies = linspace(-2, 2, 500);  
S_f_analytic = exp(-pi^2 * 72 * frequencies.^2);  

figure;
plot(frequencies, abs(S_f_analytic), 'LineWidth', 2);  
xlabel('Frequency (Hz)'); ylabel('|S(f)|');
title('Analytical Computation of Fourier Transform for S(f)');
grid on;
