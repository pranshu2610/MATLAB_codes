clc;
clear all;
% wn=input('Enter the value of Wn: ');
% zeta=input('Enter the value of Zeta: ');
wn = 4;
zeta = sqrt(2);
num=[wn*wn];
den=[1 2*zeta*wn wn*wn];
sys=tf(num, den);
step(sys,'m'); hold on;
zeta = 1;
den=[1 2*zeta*wn wn*wn];
sys=tf(num, den);
step(sys, 'r'); hold on;
zeta = 0.5;
den=[1 2*zeta*wn wn*wn];
sys=tf(num, den);
step(sys, 'g'); hold on;
zeta = 0.1;
den=[1 2*zeta*wn wn*wn];
sys=tf(num, den);
step(sys, 'b'); 