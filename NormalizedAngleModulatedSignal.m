% Task 1: Generation of the normalized Angle Modulated signal
clear all;
clc;

% Define parameters
A_m = 2.5;
A_c = 2.5;
F_m = 1000;
F_c = 10000;
fs = 1000000;
t = linspace(0, 0.002, fs);
K_p = pi;
K_f = 80;

% Generate modulating signals
triangular_wave = A_m * sawtooth(2 * pi * F_m * t);
sine_wave = A_m * sin(2 * pi * F_m * t);
square_wave = A_m * square(2 * pi * F_m * t);

% Phase Modulation (PM) signals
triangular_PM = A_c * cos(2 * pi * F_c * t + K_p * triangular_wave);
sine_PM = A_c * cos(2 * pi * F_c * t + K_p * sine_wave);
square_PM = A_c * cos(2 * pi * F_c * t + K_p * square_wave);

% Frequency Modulation (FM) signals
triangular_integral = cumtrapz(t, triangular_wave);
triangular_FM = A_c * cos(2 * pi * F_c * t + K_f * triangular_integral);
sine_integral = cumtrapz(t, sine_wave);
sine_FM = A_c * cos(2 * pi * F_c * t + K_f * sine_integral);
square_integral = cumtrapz(t, square_wave);
square_FM = A_c * cos(2 * pi * F_c * t + K_f * square_integral);

% Plot the signals
figure;
subplot(3, 3, 1);
plot(t, sine_wave);
ylabel('Message');
xlabel('Time [sec]');
title('Sine Wave');

subplot(3, 3, 2);
plot(t, square_wave);
ylabel('Message');
xlabel('Time [sec]');
title('Square Wave');

subplot(3, 3, 3);
plot(t, triangular_wave);
xlabel('Time [sec]');
ylabel('Message');
title('Triangular Wave');

subplot(3, 3, 4);
plot(t, sine_FM);
title('FM Sine Wave');

subplot(3, 3, 5);
plot(t, square_FM);
xlabel('Time [sec]');
ylabel('Message');
title('FM Square Wave');

subplot(3, 3, 6);
plot(t, triangular_FM);
ylabel('Message');
xlabel('Time [sec]');
title('FM Triangular Wave');

subplot(3, 3, 7);
plot(t, sine_PM);
ylabel('Message');
xlabel('Time [sec]');
title('PM Sine Wave');

subplot(3, 3, 8);
plot(t, square_PM);
ylabel('Message');
xlabel('Time [sec]');
title('PM Square Wave');

subplot(3, 3, 9);
plot(t, triangular_PM);
title('PM Triangular Wave');
ylabel('Message');
xlabel('Time [sec]');
