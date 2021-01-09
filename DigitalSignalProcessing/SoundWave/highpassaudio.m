clear all
clc

N=500;
h1=[];

for n=-N:N  
    if n==0
        hn=1/2;
        stem(0,1/2);
    else
%         hn=((sin(n*pi)-sin(2*n*pi))/(n*pi));
        hn=((sin(n)-sin(n*0.7))/(n));
    end
    h1 =[h1,hn];
end

load handel.mat
[y,fs]=audioread('sample.wav');
y = y(:,1);
dt = 1/fs;
t = 0:dt:(length(y)*dt)-dt;
figure(1);
plot(y); xlabel('Seconds'); ylabel('Amplitude');
y=conv(y,h1);
figure(2);
plot(y); xlabel('Seconds'); ylabel('Amplitude');
sound(y,fs);
figure(3);
freqz(y);