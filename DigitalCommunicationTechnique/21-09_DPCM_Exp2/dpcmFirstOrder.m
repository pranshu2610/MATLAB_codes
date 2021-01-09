clc;
clear all;close all;
%% Continuos Time
Ts= 0.01;
Td=0.5;
t= 0:Ts:Td;
x= 1 + sin (2*pi*2*t)+ 2*sin(2*pi*6*t);
subplot(5, 1, 1)
plot(t, x, 'b'); grid on; hold on
title("Original Signal");
%% DPCM based on Difference/1st order predictor
for k=1:length(x)
    if k==1
        yd(k)=x(k);
    else
        yd(k)=x(k)-x(k-1);
    end
end
subplot(5,1,2)
stem(t,yd,'r'); hold on; grid on;
title("Difference/1st order predictor");
%% Quantizer & Encoder
x= yd;
yq=[]; bn=[];
for n=1:length(t)
    if x(n)>=-1 && x(n)<-0.5
        y=-0.75;
        b='000';
    elseif x(n)>=-0.5 && x(n)<0
        y=-0.25;
        b='001';
    elseif x(n)>=0 && x(n)<0.5
        y=0.25;
        b='010';
    elseif x(n)>=0.5 && x(n)<1
        y=0.75;
        b='011';
    elseif x(n)>=1 && x(n)<1.5
        y=1.25;
        b='100';
    end
    yq=[yq, y];
    bn=[bn, b];
end
subplot(5,1,3);
stairs(t, yq); hold on; grid on;
title("Quantized Signal");
%% LPF & Decoding
noOfSamples = length(bn);
yRec =[]; % y Receieved acronym yRec
for n=1:3:noOfSamples
    if bn(n:n+2)=='000'
        yR=-0.75;
    elseif bn(n:n+2)=='001'
        yR=-0.25;
    elseif bn(n:n+2)=='010'
        yR=0.25;
    elseif bn(n:n+2)=='011'
        yR=0.75;
    elseif bn(n:n+2)=='100'
        yR=1.25;
    end
    yRec=[yRec, yR];
end

subplot(5,1,4);
stairs(t, yRec); hold on; grid on;

fc= 20; % fc > 2W so fc > 2*6  (within Nyquist Range)

yLP = lowpass(yRec, fc, 1/Ts);
plot(t, yLP); hold on; 
title("Received Signal and Low pass Filter Output");
%% Retrieving original signal
xRet = [];
for n=1:length(t)
    if n==1
        y=yLP(n);
    else
        y=yLP(n)+xRet(n-1);
    end
    xRet=[xRet, y];
end
subplot(5,1,5);
plot(t, xRet);grid on;
title("Retrieving original signal");
        