
R = 6;
C = 4 * 1e-3;
RC = R * C;
fs = 1000;                 
N = 10000;
t = (0:N-1)/fs;              
variance = 10;

% white gaussian noise
white_noise = sqrt(variance) * randn(1, N);

% convert analog RC to digital LPF (1st order Butterworth)
fc = 1 / (2 * pi * RC);      
Wn = fc / (fs/2);            
[b, a] = butter(1, Wn);      

% filter the noise
filtered_noise = filter(b, a, white_noise);

% time domain plot
figure;
subplot(2,1,1);
plot(t, white_noise, 'r');
xlabel('Time (s)');
ylabel('Amplitude');
title('Original White Noise');

subplot(2,1,2);
plot(t, filtered_noise, 'b');
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered White Noise');

% PSD comparison
figure;
[pxx1, f1] = pwelch(white_noise, [], [], [], fs);
[pxx2, f2] = pwelch(filtered_noise, [], [], [], fs);

plot(f1, 10*log10(pxx1), 'r'); hold on;
plot(f2, 10*log10(pxx2), 'b');
legend('Original Noise', 'Filtered Noise');
xlabel('Frequency (Hz)');
ylabel('Power Spectral Density (dB/Hz)');
title('PSD Comparison');
grid on;
