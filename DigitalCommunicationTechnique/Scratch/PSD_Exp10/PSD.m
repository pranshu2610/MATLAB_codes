clc; clear;
%% PSD of ASK
f = -30:0.001:30;
fc = 10;
Tb = 1;
Sy = sin((pi*Tb).*(f-fc)).^2;
Sy = Sy ./((f-fc).^2);
Sy = Sy./(pi^2);
Sy = Sy / (8*Tb);
plot(f, Sy); grid on;

subplot(3,1,1)
plot(f, Sy); grid on;
title("PSD of ASK");
ylim([-0.15 0.3]);

%% PSD of PSK
f = -30:0.001:30;
fc = 20;
Tb = 1;
% Sy = sin((pi*Tb).*f).^2;
% Sy = Sy ./(f.^2);
% Sy = Sy./(Tb*(pi^2));
% plot(f, Sy); grid on;

Sz1 = (sin((pi*Tb).*(f-fc)).^2);
Sz1 = Sz1 ./ ((f-fc).^2);
Sz1 = Sz1 / (pi^2);

Sz2 = (sin((pi*Tb).*(f+fc)).^2);
Sz2 = Sz2 ./ ((f+fc).^2);
Sz2 = Sz2 / (pi^2);

Sz = (Sz1 + Sz2)/(4*Tb);

subplot(3,1,2)
plot(f, Sz); grid on;
title("PSD of PSK");
ylim([-0.15 0.3]);

%% PSD of FSK
f = -30:0.001:30;
fc1 = 10;
fc2 = 25;
Tb = 1;

Sz1 = (sin((pi*Tb).*(f-fc1)).^2);
Sz1 = Sz1 ./ ((f-fc1).^2);
Sz1 = Sz1 / (pi^2);

Sz2 = (sin((pi*Tb).*(f+fc1)).^2);
Sz2 = Sz2 ./ ((f+fc1).^2);
Sz2 = Sz2 / (pi^2);

Sz3 = (sin((pi*Tb).*(f-fc2)).^2);
Sz3 = Sz3 ./ ((f-fc2).^2);
Sz3 = Sz3 / (pi^2);

Sz4 = (sin((pi*Tb).*(f+fc2)).^2);
Sz4 = Sz4 ./ ((f+fc2).^2);
Sz4 = Sz4 / (pi^2);

Sz = (Sz1 + Sz2 + Sz3 + Sz4)/(4*Tb);

subplot(3,1,3);
plot(f, Sz); grid on;
title("PSD of FSK");
ylim([-0.15 0.3]);