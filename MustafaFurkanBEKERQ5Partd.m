x_down = x_bpf .* cos(2*pi*fc*t);
figure;
X_down = fftshift(abs(fft(x_down)));
plot(f/1000, X_down);
xlabel('Frequency (kHz)');
ylabel('|X_{down}(f)|');
title('Downconverted Signal');

lpf_order = 101;
lpf = ones(lpf_order,1)/lpf_order;
x_rec = conv(x_down, lpf, 'same');
x_rec = x_rec / max(abs(x_rec));
figure;
X_rec = fftshift(abs(fft(x_rec)));
plot(f/1000, X_rec);
xlabel('Frequency (kHz)');
ylabel('|X_{rec}(f)|');
title('Recovered Baseband Signal');

sound(x_rec, Fs);
