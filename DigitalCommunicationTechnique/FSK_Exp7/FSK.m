clc; clear;
%% Original Signal
bn = '10010110';
ln = length(bn);
Tb = 1;
Ts = 0.01;
t = 0:Ts:Tb-Ts;
fc1 = 2; fc2 = 5;
ct1 = sin(2*pi*fc1*t);
ct2 = sin(2*pi*fc2*t);

p0 = ones(1,length(t));
p1 = ones(1,length(t));

%% Signal Modulation
xp = [];
for n = 1:ln
    if bn(n) == '0'
        xn = p0.*ct1;
    else
        xn = p1.*ct2;
    end
    xp = [xp, xn];
end
subplot(4,1,1)
plot(0:Ts:ln*Tb-Ts, xp, 'b'); grid on; axis([0, ln, -2, 2]);
title("Modulated Signal");
%% Received Signal 
xr = awgn(xp, 10);
subplot(4,1,2)
plot(0:Ts:ln*Tb-Ts, xr, 'r'); grid on; axis([0, ln, -2, 2]);
title("Received Signal");
t1 = 0:Ts:ln*Tb-Ts;
CT1 = sin(2*pi*fc1*t1);
CT2 = sin(2*pi*fc2*t1);
yr1 = xr.*CT1;
yr2 = xr.*CT2;

%% Rectified Signal
subplot(4,1,3);
plot(0:Ts:ln*Tb-Ts, yr1, 'b'); grid on; axis([0, ln, -2, 2]);
title("Rectified Signal with freq=fc1");

subplot(4,1,4);
plot(0:Ts:ln*Tb-Ts, yr2, 'b'); grid on; axis([0, ln, -2, 2]);
title("Received Signal with freq=fc2");

meanBox = [];
for n = 0:ln-1
    meanBox(n+1, 1) = n+1;
    meanBox(n+1, 2) = mean(yr1(n/Ts+1 :(n+1)/Ts));  %Slicing 0 to 1/Ts, 1/Ts to 2/Ts
    meanBox(n+1, 3) = mean(yr2(n/Ts+1 :(n+1)/Ts));
end
disp(meanBox);

threshold = 0.25;
retX = [];
for n = 0:ln-1
    if (meanBox(n+1, 3) > threshold)
        sig = '1';
    else
        sig = '0';
    end
    retX = [retX, sig];
end
disp("Received Signal : ");
disp(retX);
