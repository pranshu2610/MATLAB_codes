clear all
clc

N=20;
h=[];
for n=-N:N  
    if n==0
        hn=1/2;
        stem(0,1/2);
    else
        hn=(sin(2*n*pi/3)-sin(n*pi/6))./(n*pi);
    end
    h=(h,hn);
end
figure(1);
stem(-N:N,h);

title('Magn. of h(n) from -N to N');

%freqz(h)
%[H,W]=freqz(h)


figure(2);
N=40;
n=0:N;
h=0;
if n==0
    h=1/2;
else
    h=(sin(2*n*pi/3)-sin(n*pi/6))./(n*pi);
end
hold on;
stem(n,h);
stem(0,1/2);
title('Magn. of h(n) from 0 to N');
