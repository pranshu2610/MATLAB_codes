clc; clear;
bn = '1011101001';
ln = length(bn);
Tb=1;
Td=10;
Ts=0.001;
t=0:Ts:Tb-Ts;
wt=3;
c=sin(2*pi*wt*t);
p0 = zeros(1,length(t));
p1 = ones(1,length(t));

%% Original Signal
xp = [];
y = [];
for n = 1:ln
    if bn(n)=='0'
        xn=p0;
        yn=c*(-1);
    else
        xn=p1;
        yn=c;
    end
    xp=[xp,xn];
    y=[y,yn];
end

t=0:Ts:Td-Ts;
subplot(4,1,1);
plot(t,xp); hold on; grid on;
title("Original Signal");
ylim([-2 2])

%% Signal Modulation
subplot(4,1,2);
plot(t, y);hold on; grid on;
title("Modulated Signal");
ylim([-2 2])

%% Received Signal
xr = awgn(y, 10);
subplot(4,1,3)
plot(t, xr, 'r'); grid on; axis([0, ln, -2, 2]);
title("Received Signal");

%% Rectified Signal
c=sin(2*pi*wt*t);
yr = xr.*c;
subplot(4,1,4)
plot(t, yr, 'r'); grid on; axis([0, ln, -2, 2]);
title("Rectified Signal");
meanBox = [];
for n = 0:ln-1
    meanBox(n+1, 1) = n+1;
    meanBox(n+1, 2) = mean(yr(n/Ts+1 :(n+1)/Ts));
end
disp(meanBox);

threshold = 0;
retX = [];
for n = 0:ln-1
    if (meanBox(n+1, 2) > threshold)
        sig = '1';
    else
        sig = '0';
    end
    retX = [retX, sig];
end
disp("Received Signal : ");
disp(retX);