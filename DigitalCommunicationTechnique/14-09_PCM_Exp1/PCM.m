clc;
clear all;close all;
%% Continuos Time
t= 0:0.01:0.5;
x= 1 + sin (2*pi*2*t)+ 2*sin(2*pi*6*t);
subplot(3,1,1);
plot(t, x, 'b'); grid on; hold on
%% Quantizer & Encoder
t= 0:0.01:0.5;
x=1 + sin (2*pi*2*t)+ 2*sin(2*pi*6*t);
yq=[]; bn=[];
for n=1:length(t)
    if x(n)>=-2 && x(n)<-1
        y=-1.5;
        b='000';
    elseif x(n)>=-1 && x(n)<0
        y=-0.5;
        b='001';
    elseif x(n)>=0 && x(n)<1
        y=0.5;
        b='010';
    elseif x(n)>=1 && x(n)<2
        y=1.5;
        b='011';
    elseif x(n)>=2 && x(n)<3
        y=2.5;
        b='100';
    elseif x(n)>=3 && x(n)<4
        y=3.5;
        b='101';
    elseif x(n)>=4 && x(n)<5
        y=4.5;
        b='110';
    elseif x(n)>=5 && x(n)<6
        y=5.5;
        b='111';
    end
    yq=[yq, y];
    bn=[bn, b];
end
subplot(3,1,2);
stairs(t, yq); hold on; grid on;

%% LPF & Decoding
noOfSamples = length(bn);
yRec =[]; % y Receieved acronym yRec
for n=1:3:noOfSamples
    if bn(n:n+2)=='000'
        yR=-1.5;
    elseif bn(n:n+2)=='001'
        yR=-0.5;
    elseif bn(n:n+2)=='010'
        yR=0.5;
    elseif bn(n:n+2)=='011'
        yR=1.5;
    elseif bn(n:n+2)=='100'
        yR=2.5;
    elseif bn(n:n+2)=='101'
        yR=3.5;
    elseif bn(n:n+2)=='110'
        yR=4.5;
    elseif bn(n:n+2)=='111'
        yR=5.5;
    end
    yRec=[yRec, yR];
end

subplot(3,1,3);
stairs(t, yRec); hold on; grid on;

fc= 20; 
Ts= 0.01;
yLP = lowpass(yRec, fc, 1/Ts);
plot(t, yLP); hold on; 