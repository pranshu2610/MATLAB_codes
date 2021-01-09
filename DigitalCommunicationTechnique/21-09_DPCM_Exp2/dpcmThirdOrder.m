clc;
clear all;close all;
%% Continuos Time
t= 0:0.01:0.5;
x= 1 + sin (2*pi*2*t)+ 2*sin(2*pi*6*t);
subplot(5, 1, 1)
plot(t, x, 'b'); grid on; hold on
title("Original Signal");
%% DPCM based on 3rd order predictor
p = [3, -3, 1]; %Taylor Series Coeffs
for k=1:length(x)
    if k==1
        yp(k)= x(k);
    elseif k==2
        yp(k)=x(k)-p(1)*x(k-1);
    elseif k==3
        yp(k)=x(k)-(p(1)*x(k-1) + p(2)*x(k-2));
    else
        yp(k)=x(k)-(p(1)*x(k-1) + p(2)*x(k-2) + p(3)*x(k-3));
    end
end
subplot(5,1,2)
stem(t,yp,'g'); hold on;
title("3rd order predictor");
%% Quantizer & Encoder
t= 0:0.01:0.5;
x= yp;
yq=[]; bn=[];
for n=1:length(t)
    if x(n)>=-1.25 && x(n)<-1
        y=-1.125;
        b='0000';
    elseif x(n)>=-1 && x(n)<-0.75
        y=-0.875;
        b='0001';
    elseif x(n)>=-0.75 && x(n)<-0.5
        y=-0.625;
        b='0010';
    elseif x(n)>=-0.5 && x(n)<-0.25
        y=-0.375;
        b='0011';
    elseif x(n)>=-0.25 && x(n)<0
        y=-0.125;
        b='0100';
    elseif x(n)>=0 && x(n)<0.25
        y=0.125;
        b='0101';
    elseif x(n)>=0.25 && x(n)<0.5
        y=0.375;
        b='0110';
    elseif x(n)>=0.5 && x(n)<0.75
        y=0.625;
        b='0111';
    elseif x(n)>=0.75 && x(n)<1
        y=0.875;
        b='1000';
    elseif x(n)>=1 && x(n)<1.25
        y=1.125;
        b='1001';
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
for n=1:4:noOfSamples
    if bn(n:n+3)=='0000'
        yR=-1.125;
    elseif bn(n:n+3)=='0001'
        yR=-0.875;
    elseif bn(n:n+3)=='0010'
        yR=-0.625;
    elseif bn(n:n+3)=='0011'
        yR=-0.375;
    elseif bn(n:n+3)=='0100'
        yR=-0.125;
    elseif bn(n:n+3)=='0101'
        yR=0.125;
    elseif bn(n:n+3)=='0110'
        yR=0.375;
    elseif bn(n:n+3)=='0111'
        yR=0.625;
    elseif bn(n:n+3)=='1000'
        yR=0.875;
    elseif bn(n:n+3)=='1001'
        yR=1.125;
    end
    yRec=[yRec, yR];
end

subplot(5,1,4);
stairs(t, yRec); hold on; grid on;

fc= 45; % fc > 2W so fc > 2*6  (within Nyquist Range)
Ts= 0.01;
yLP = lowpass(yRec, fc, 1/Ts);
plot(t, yLP); hold on; 
title("Received Signal and Low pass Filter Output");
%% Retrieving original signal
t= 0:0.01:0.5;
p = [3,-3,1];
xRet = [];
yLP = yRec;
for n=1:length(t)
    if n==1
        y=yLP(n);
    elseif n==2
        y=yLP(n)+(p(1)*xRet(n-1));
    elseif n==3
        y=yLP(n)+(p(1)*xRet(n-1)+p(2)*xRet(n-2));
    else
        y=yLP(n)+(p(1)*xRet(n-1)+p(2)*xRet(n-2)+p(3)*xRet(n-3));
    end
    xRet=[xRet, y];
end
subplot(5,1,5);
plot(t, xRet);grid on;
title("Retrieving original signal");
        