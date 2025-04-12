X = fft(x_up);
N = length(X);
f = (-N/2:N/2-1)*(Fs/N);
X_shifted = fftshift(X);

mask = zeros(N,1);
mask(f>24000 & f<28000) = 1;

X_bpf_shifted = X_shifted .* mask;
X_bpf = ifftshift(X_bpf_shifted);
x_bpf = real(ifft(X_bpf));
X_bpf_plot = fftshift(abs(fft(x_bpf)));

figure;
plot(f/1000, X_bpf_plot);
xlabel('Frequency (kHz)');
ylabel('|X_{BPF}(f)|');
title('Band-Passed Upper Side Band');
