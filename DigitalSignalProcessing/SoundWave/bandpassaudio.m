clear all
clc

N=500;
h2=[];
for n=0:N  
    if n==0
        hn=1/2;
        stem(0,1/2);
    else
        hn=(sin(2*n*pi/3)-sin(n*pi/6))./(n*pi);
    end
    h2 =[h2,hn];
end

load handel.mat
[y,fs]=audioread('sample.wav');
y = y(:,1);
dt = 1/fs;
t = 0:dt:(length(y)*dt)-dt;
figure(1);
plot(y); xlabel('Seconds'); ylabel('Amplitude');
y=conv(y,h2);
figure(2);
plot(y); xlabel('Seconds'); ylabel('Amplitude');
sound(y,fs);
figure(3);
freqz(y);

