% Task 2: Narrow band and Wide band Modulation
clear;
clc;

% Define parameters
fs = 1000000;
t = 0:(1/fs):(0.002-1/fs);
A_c = 2.5;
F_c = 10000;
A_m = 2.5;
F_m = 1000;
W_m = 2 * pi * F_m;
W_c = 2 * pi * F_c;
Beta = [0.01 1 2.4 10 50];

% Initialize arrays for storing results
S = [];
k_f = [];
Sf = [];
maxfreqdev = [];

for i = 1:length(Beta)
    maxfreqdev(i) = W_m * Beta(i); % Maximum frequency deviation
    k_f(i) = Beta(i) * W_m / A_m; % Frequency scaling factor
    S(i,:) = A_c * cos(W_c * t + Beta(i) * sin(W_m * t)); % FM signal
    Sf(i,:) = abs(fftshift(fft(S(i,:)))) / length(t); % FFT of FM signal
end

% Plotting the FM signals in time domain
figure;
for i = 1:length(Beta)
    subplot(length(Beta), 1, i);
    plot(t, S(i,:));
    title(['FM signal Beta=' num2str(Beta(i))]);
end

% Plotting the FFT of FM signals
l = length(t);
w_f = (-l/2:l/2-1) * (fs/l);

figure;
for i = 1:length(Beta)
    subplot(length(Beta), 1, i);
    plot(w_f, Sf(i,:));
    title(['FFT of FM signal Beta=' num2str(Beta(i))]);
end

% Display Table I
table = [Beta; maxfreqdev; k_f]';
fprintf('Table 1:\n');
fprintf('\t\tModulation Index β\t\tΔf\t\t\t\tkf\n');
for j = 1:length(Beta)
    fprintf('\t\t%0.2f\t\t\t\t\t%0.2f\t\t\t\t%0.2f\n', table(j, 1), table(j, 2), table(j, 3));
end

% Parameters for Table II
fm_2 = 6000;
Wm_2 = 2 * pi * fm_2;
kf_2 = 1.2e4 * pi;
Am_2 = [1 2 4 24];
Beta_2 = kf_2 * Am_2 / Wm_2;
maxfreqdev2 = kf_2 * Am_2;

% Display Table II
fprintf('\nTable 2:\n');
fprintf('\t\tAmplitude of modulating signal, A\t\tΔf\t\t\t\tModulation Index β\n');
for j = 1:length(Am_2)
    fprintf('\t\t%0.2f\t\t\t\t\t%0.2f\t\t\t\t%0.2f\n', Am_2(j), maxfreqdev2(j), Beta_2(j));
end
