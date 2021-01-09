clc; clear;
bn = '1011101001';
ln = length(bn);
Tb=1;
Td=10;
Ts=0.001;
t=0:Ts:Tb-Ts;
%Bipolar 
p0 = zeros(1,length(t));
p1p = ones(1,length(t));
p1n = -1*ones(1,length(t));
flag = 0;

xp = [];
for n = 1:ln
    if bn(n)=='0'
        xn=p0;
    elseif mod(flag,2)
        xn=p1n;
        flag=flag+1;
    else
        xn=p1p;
        flag=flag+1;
    end
    xp=[xp,xn];
end

t=0:Ts:Td-Ts;

subplot(3,1,1);
plot(t,xp); hold on; grid on;
title("Original Signal (Bipolar)");
ylim([-2 2])
subplot(3,1,2);
yr=awgn(xp, 20);
plot(t,yr);hold on; grid on;
title("Received Signal");
ylim([-2 2])

%% Matched Filter
t=0:Ts:Tb-Ts;
h0 = zeros(1,length(t));
h1 = ones(1,length(t));
r0 = conv(yr,h0);
r1 = conv(yr,h1);
yo = [];
yRet=[];
for n = 1/Ts:1/Ts:(Td+1)/Ts-1
    if and(r1(n)- r0(n) < Td/2, r1(n)- r0(n)> (-1*Td/2))
        yR=p0;
        y='0';
    else
        if r1(n)-r0(n)>0
            yR=p1p;
        else
            yR=p1n;
        end
        y='1';
    end
    yRet=[yRet,yR];
    yo=[yo,y];
end

t=0:Ts:Td-Ts;
subplot(3,1,3);
plot(t, yRet);hold on; grid on;
title("Retrieved Signal");
ylim([-2 2]);
disp(yo);