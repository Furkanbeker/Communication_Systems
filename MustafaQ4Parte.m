Tmax = 10 * sqrt(72)/2;  
N = 65536;  
t = linspace(-Tmax, Tmax, N); 
dt = t(2) - t(1);  

s_t = (1/sqrt(72*pi)) * exp(-t.^2 / 72);

S_f = fftshift(fft(s_t) * dt);  
frequencies = linspace(-1/(2*dt), 1/(2*dt), N);  
df = frequencies(2) - frequencies(1);  

energy_time = sum(abs(s_t).^2) * dt;
energy_freq = sum(abs(S_f).^2) * df;

fprintf('Energy in time domain: %.6f\n', energy_time);
fprintf('Energy in frequency domain: %.6f\n', energy_freq);
fprintf('Difference: %.6f\n', abs(energy_time - energy_freq));
