% Task 3: The Modulation Index of an FM signal
clear;
clc;

% Define parameters
fs = 1000000;
t = 0:(1/fs):(0.002-1/fs);
A_c = 2.5;
F_c = 10000;
F_m = 1000;
W_m = 2 * pi * F_m;
W_c = 2 * pi * F_c;
A_m = 2.5;
k_f = 80;
Beta = [1 2 5 10 20];

% FM signal with varying Beta and constant modulating frequency
S_1 = [];
Sf_1 = [];
for i = 1:length(Beta)
    S_1(i,:) = A_c * cos(W_c * t + Beta(i) * sin(W_m * t));
    Sf_1(i,:) = abs(fftshift(fft(S_1(i,:)))) / length(t);
end

% Plot FFT of FM signals with varying Beta
l = length(t);
w_f = (-l/2:l/2-1) * (fs/l);

figure;
for i = 1:length(Beta)
    subplot(length(Beta), 1, i);
    plot(w_f, Sf_1(i,:));
    title(['FFT of FM signal Beta=' num2str(Beta(i))]);
end

% FM signal with varying Beta and constant frequency deviation
deltam = k_f * A_m;
S_2 = [];
Sf_2 = [];
for i = 1:length(Beta)
    W_m = deltam / Beta(i);
    S_2(i,:) = A_c * cos(W_c * t + Beta(i) * sin(W_m * t));
    Sf_2(i,:) = abs(fftshift(fft(S_2(i,:)))) / length(t);
end

% Plot FFT of FM signals with varying Beta
figure;
for i = 1:length(Beta)
    subplot(length(Beta), 1, i);
    plot(w_f, Sf_2(i,:));
    title(['FFT of FM signal Beta=' num2str(Beta(i))]);
end
