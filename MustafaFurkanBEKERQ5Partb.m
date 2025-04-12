%Fs = 96000;
%recObj = audiorecorder(Fs, 16, 1);
%recordblocking(recObj, 5);
%x = getaudiodata(recObj);
%x = x / max(abs(x));
t = (0:length(x)-1)' / Fs;
fc = 26000;

x_up = x .* cos(2*pi*fc*t);

N = length(x);
f = linspace(-Fs/2, Fs/2, N);

X_orig = fftshift(abs(fft(x)));
X_up = fftshift(abs(fft(x_up)));

figure;
plot(f/1000, X_orig);
xlabel('Frequency (kHz)');
ylabel('|X(f)|');
title('Original Signal Spectrum');

figure;
plot(f/1000, X_up);
xlabel('Frequency (kHz)');
ylabel('|X_{up}(f)|');
title('Upconverted Signal Spectrum');
