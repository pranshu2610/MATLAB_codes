clc;
clear all;
wn = 4;
zeta = sqrt(2);
num=[wn*wn];
den=[1 2*zeta*wn wn*wn];
sys=tf(num, den);
step(sys,'m'); hold on;

Kd=300;
c=tf([Kd 0], 1);
sys1=cascade(c,sys);
sys2=feedback(sys1,1);
step(sys2,'m'); hold on;