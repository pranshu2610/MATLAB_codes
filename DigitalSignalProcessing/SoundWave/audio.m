clear all
clc
load handel.mat
[y,fs]=audioread('sample.wav');
y = y(:,1);
dt = 1/fs;
t = 0:dt:(length(y)*dt)-dt;
figure(1);
plot(t,y); xlabel('Seconds'); ylabel('Amplitude');
% sound(y,fs);
figure(2);
freqz(y);