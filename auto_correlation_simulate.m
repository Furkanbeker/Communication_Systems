
R = 6;
C = 4e-3;
RC = R * C;
fs = 1000;                     
N = 10000;                     
variance = 10;
num_trials = 100;              

% convert RC to sample delays
tau1_samples = round(RC * fs);
tau2_samples = round(4.6 * RC * fs);

% design digital LPF
fc = 1 / (2 * pi * RC);       
Wn = fc / (fs/2);            
[b, a] = butter(1, Wn);        

% initialize correlation accumulators
Ry_tau1_sum = 0;
Ry_tau2_sum = 0;

% simulation loop
for i = 1:num_trials
    % generate white noise
    noise = sqrt(variance) * randn(1, N);
    
    % filter the noise
    y = filter(b, a, noise);
    
    % compute y(t) * y(t + tau1)
    y1 = y(1:end - tau1_samples);
    y2 = y(tau1_samples + 1:end);
    Ry_tau1_sum = Ry_tau1_sum + mean(y1 .* y2);
    
    % compute y(t) * y(t + tau2)
    y3 = y(1:end - tau2_samples);
    y4 = y(tau2_samples + 1:end);
    Ry_tau2_sum = Ry_tau2_sum + mean(y3 .* y4);
end

% average over trials
Ry_tau1 = Ry_tau1_sum / num_trials;
Ry_tau2 = Ry_tau2_sum / num_trials;

% display result
fprintf('\n--- Auto-correlation Simulation Results ---\n');
fprintf('Delay τ₁ = RC      → Estimated R_y(τ₁): %.4f\n', Ry_tau1);
fprintf('Delay τ₂ = 4.6·RC  → Estimated R_y(τ₂): %.4f\n', Ry_tau2);
fprintf('-------------------------------------------\n\n');
