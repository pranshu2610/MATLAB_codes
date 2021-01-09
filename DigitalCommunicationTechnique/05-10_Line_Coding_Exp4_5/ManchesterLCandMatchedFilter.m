clc; clear;
bn = '1011101001';
ln = length(bn);
Tb=1;
Td=10;
Ts=0.001;
t=0:Ts:Tb-Ts;

p0 = [-1*ones(1,length(t)/2), ones(1,length(t)/2)];
p1 = [ones(1,length(t)/2), -1*ones(1,length(t)/2)];

xp = [];
for n = 1:ln
    if bn(n)=='0'
        xn=p0;
    else
        xn=p1;
    end
    xp=[xp,xn];
end

t=0:Ts:Td-Ts;

subplot(3,1,1);
plot(t,xp); hold on; grid on;
title("Original Signal (Manchester)");
ylim([-2 2])
subplot(3,1,2);
yr=awgn(xp, 20);
plot(t,yr);hold on; grid on;
title("Received Signal");
ylim([-2 2])

%% Matched Filter 
h0 = p1;
h1 = p0;
r0 = conv(yr,h0);
r1 = conv(yr,h1);
yo = [];
yRet=[];
for n = 1/Ts:1/Ts:(Td+1)/Ts-1
    if r0(n) > r1(n)
        yR=p0;
        y = '0';
    elseif r1(n) > r0(n)
        yR=p1;
        y='1';
    end
    yRet=[yRet,yR];
    yo=[yo,y];
end

t=0:Ts:Td-Ts;
subplot(3,1,3);
plot(t,yRet);hold on; grid on;
title("Retrieved Signal");
ylim([-2 2])
disp(yo);