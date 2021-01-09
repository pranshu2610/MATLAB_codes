clear all
clc

N=50;
h1=[];

for n=-N:N  
    if n==0
        hn=1/2;
        stem(0,1/2);
    else
        hn=((sin(n*pi)-sin(2*n*pi/3))./(n*pi));
    end
    h1 =[h1,hn];
end
figure(1);
stem(-N:N,h1);
figure(2)
freqz(h1);

m=0:400;
x=sin(0.8*pi*m);
y=conv(x,h1);
figure(3)
plot(x);
figure(4)
plot(y);