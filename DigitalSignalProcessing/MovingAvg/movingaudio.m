clear all
clc
load handel.mat
[y,fs]=audioread('Recording.m4a');
y = y(:,1);
dt = 1/fs;
t = 0:dt:(length(y)*dt)-dt;
figure(1);
plot(t,y); xlabel('Seconds'); ylabel('Amplitude');
% sound(y,fs);
figure(2);
freqz(y);
g=[];
for m=1:length(t)
    if m==1
        g(m)=(1/3)*(y(m)+y(m+1));
    elseif m==length(t)
        g(m)=(1/3)*(y(m-1)+y(m));
    else
        g(m)=(1/3)*(y(m-1)+y(m)+y(m+1));
    end
end
figure(3);
plot(g);
sound(g,fs);
figure(4);
freqz(g);