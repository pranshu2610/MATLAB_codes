clc; clear;
bn = '1011101001';
ln = length(bn);
Tb=1;
Td=10;
Ts=0.001;
t=0:Ts:Tb-Ts;
%Polar NRZ
p0 = -1*ones(1,length(t));
p1 = ones(1,length(t));

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
title("Original Signal (Polar)");
ylim([-2 2])
subplot(3,1,2);
yr=awgn(xp, 20);
plot(t,yr);hold on; grid on;
title("Received Signal");
ylim([-2 2])

%% Matched Filter
t=0:Ts:Tb-Ts;
h0 = -1*ones(1,length(t));
h1 = ones(1,length(t));
r0 = conv(yr,h0);
r1 = conv(yr,h1);

yRet=[];
for n = 1/Ts:1/Ts:(Td+1)/Ts-1
    if r0(n) > r1(n)
        yR=p0;
    elseif r1(n) > r0(n)
        yR=p1;
    end
    yRet=[yRet,yR];
end

t=0:Ts:Td-Ts;
subplot(3,1,3);
plot(t,yRet);hold on; grid on;
title("Retrieved Signal");
ylim([-2 2])