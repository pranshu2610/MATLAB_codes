clc;
clear all;close all;
%% Continuos Time
Ts=0.01;
Td=0.5;
t= 0:Ts:Td;
x= 1 + sin (2*pi*2*t)+ 2*sin(2*pi*6*t);
subplot(5, 1, 1)
plot(t, x, 'b'); grid on; hold on
title("Original Signal");
%% DPCM based on 2nd order predictor
p = [2, -1]; %Taylor Series Coeffs
for k=1:length(x)
    if k==1
        yp(k)= x(k);
    elseif k==2
        yp(k)=x(k)-p(1)*x(k-1);
    else
        yp(k)=x(k)-(p(1)*x(k-1) + p(2)*x(k-2));
    end
end
subplot(5,1,2)
stem(t,yp,'g'); hold on;
title("2nd order predictor");
%% Quantizer & Encoder
x= yp;
yq=[]; bn=[];
for n=1:length(t)
    if x(n)>=-0.5 && x(n)<-0.25
        y=-0.375;
        b='000';
    elseif x(n)>=-0.25 && x(n)<0
        y=-0.125;
        b='001';
    elseif x(n)>=0 && x(n)<0.25
        y=0.125;
        b='010';
    elseif x(n)>=0.25 && x(n)<0.5
        y=0.375;
        b='011';
    elseif x(n)>=0.5 && x(n)<0.75
        y=0.625;
        b='100';
    elseif x(n)>=0.75 && x(n)<1
        y=0.875;
        b='101';
    elseif x(n)>=1 && x(n)<1.25
        y=1.125;
        b='110';
    end
    yq=[yq, y];
    bn=[bn, b];
end
subplot(5,1,3);
stairs(t, yq); hold on;
title("Quantized Signal");
%% LPF & Decoding
noOfSamples = length(bn);
yRec =[]; % y Receieved acronym yRec
for n=1:3:noOfSamples
    if bn(n:n+2)=='000'
        yR=-0.375;
    elseif bn(n:n+2)=='001'
        yR=-0.125;
    elseif bn(n:n+2)=='010'
        yR=0.125;
    elseif bn(n:n+2)=='011'
        yR=0.375;
    elseif bn(n:n+2)=='100'
        yR=0.625;
    elseif bn(n:n+2)=='101'
        yR=0.875;
    elseif bn(n:n+2)=='110'
        yR=1.125;
    end
    yRec=[yRec, yR];
end

subplot(5,1,4);
stairs(t, yRec); hold on; grid on;

fc= 25; % fc > 2W so fc > 2*6  (within Nyquist Range)
yLP = lowpass(yRec, fc, 1/Ts);
plot(t, yLP); hold on; 
title("Received Signal and Low pass Filter Output");
%% Retrieving original signal
p = [2, -1];
xRet = [];
for n=1:length(t)
    if n==1
        y=yLP(n);
    elseif n==2
        y=yLP(n)+p(1)*xRet(n-1);
    else
        y=yLP(n)+p(1)*xRet(n-1) + p(2)*xRet(n-2);
    end
    xRet=[xRet, y];
end
subplot(5,1,5);
plot(t, xRet);grid on;
title("Retrieving original signal");
        