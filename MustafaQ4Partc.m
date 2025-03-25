Tmax = 10 * sqrt(72)/2;  
N = 65536;  
t = linspace(-Tmax, Tmax, N); 
dt = t(2) - t(1);  

s_t = (1/sqrt(72*pi)) * exp(-t.^2 / 72);

S_f = fftshift(fft(s_t) * dt);  
frequencies = linspace(-1/(2*dt), 1/(2*dt), N);  

figure;
plot(frequencies, abs(S_f), 'LineWidth', 2);  
xlabel('Frequency (Hz)'); ylabel('|S(f)|');
title('FFT-Based Computation of Fourier Transform for S(f)');
axis([-2 2 0 max(abs(S_f))]);
grid on;
