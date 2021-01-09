clc 
close all
t=0:0.01:1;
f=2;
w=2*pi*f;
a=1;
y=a*sin(w*t);
plot(t,y);grid on;hold  on;
stem(t,y);hold off;
