clc; clear;
bn = '1011101001';
ln = length(bn);
Tb=1;
Ts=0.001;
t=0:Ts:Tb-Ts;
a=3;
switch a
    case 1 %Polar NRZ
        p0 = -1*ones(1,length(t));
        p1 = ones(1,length(t));
    case 2 %Polar RZ
        p0 = [-1*ones(1,length(t)/2), zeros(1,length(t)/2)];
        p1 = [ones(1,length(t)/2), zeros(1,length(t)/2)];
    case 3 %Manchester
        p0 = [-1*ones(1,length(t)/2), ones(1,length(t)/2)];
        p1 = [ones(1,length(t)/2), -1*ones(1,length(t)/2)];
end

xp = [];
for n = 1:ln
    if bn(n)=='0'
        xn=p0;
    else
        xn=p1;
    end
    xp=[xp,xn];
end

Tb=10;
Ts=0.001;
t=0:Ts:Tb-Ts;

subplot(2,1,1);
plot(t,xp); hold on; grid on;
ylim([-2 2])
subplot(2,1,2);
plot(awgn(xp, 20));hold on; grid on;
ylim([-2 2])