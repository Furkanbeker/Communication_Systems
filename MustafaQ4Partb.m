Tmax = 10 * sqrt(72)/2;  
N = 65536;  
t = linspace(-Tmax, Tmax, N); 
dt = t(2) - t(1);  

s_t = (1/sqrt(72*pi)) * exp(-t.^2 / 72);

frequencies = linspace(-2, 2, 500);  
S_f_numeric = zeros(size(frequencies));  

for k = 1:length(frequencies)
    f = frequencies(k);
    S_f_numeric(k) = sum(s_t .* exp(-1j * 2 * pi * f * t)) * dt;
end

figure;
plot(frequencies, abs(S_f_numeric), 'LineWidth', 2);  
xlabel('Frequency (Hz)'); ylabel('|S(f)|');
title('Numerical Computation of Fourier Transform for S(f)');
grid on;
