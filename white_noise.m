
N = 10000;                  % samples
noise_mean = 0;             % mean
variance = 10;              % c4 = 10

% white noise (WGN-based)
white_noise = wgn(1, N, 10*log10(variance)); 

% autocorrelation
figure;
autocorr(white_noise, 'NumLags', 100);
title('White Noise Auto-correlation');

% PSD
figure;
pwelch(white_noise, [], [], [], 1);
title('White Noise Power Spectral Density');
