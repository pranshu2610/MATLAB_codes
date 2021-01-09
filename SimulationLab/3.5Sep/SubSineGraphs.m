clear
close all
clc

subplot(2,2,1);
d=2*pi;A=4;fc=(1/(2*pi));
phi=0;
ts = linspace(0,d,50);
y=Fun_sin(A,fc,ts,phi);
plot(ts,y);hold on;
stem(ts,y);xlabel='Angle(Rad)';
ylabel='Amp';hold off;
title('Graph 1');

subplot(2,2,2);
d=6*pi;A=2;fc=(1/(4*pi));
phi=pi/6;
ts = linspace(0,d,50);
y=Fun_sin(A,fc,ts,phi);
plot(ts,y,'g');hold on;
stem(ts,y,'g');xlabel='Angle(Rad)';
ylabel='Amp';hold off;
title('Graph 2');

subplot(2,2,3);
d=5*pi;A=1;fc=(1/(3*pi));
phi=pi/3;
ts = linspace(0,d,50);
y=Fun_sin(A,fc,ts,phi);
plot(ts,y,'b');hold on;
stem(ts,y,'b');xlabel='Angle(Rad)';
ylabel='Amp';hold off;
title('Graph 3');

subplot(2,2,4);
d=2*pi;A=4;fc=(1/(2*pi));
phi=pi;
ts = linspace(0,d,50);
y=Fun_sin(A,fc,ts,phi);
plot(ts,y,'y');hold on;
stem(ts,y,'y');xlabel='Angle(Rad)';
ylabel='Amp';hold off;
title('Graph 4');


function [y] = Fun_sin(A,fc,ts,phi)
    y = A*sin(2*pi*fc*ts+phi);
end