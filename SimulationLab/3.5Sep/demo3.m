clear
close all
clc
t=linspace(0,2*pi,50);
y=sin(t);
plot(t,y);hold on;
stem(t,y);xlabel='Angle(Rad)';
ylabel='Amp';hold off;