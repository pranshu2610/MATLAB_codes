clc;
clear all;
close all;

%% Continuos Time
Ts = 0.01;
Td = 0.5;
t= 0:Ts:Td;
x= 1 + sin (2*pi*2*t)+ 2*sin(2*pi*6*t);
subplot(2,1,1);
plot(t, x, 'b'); grid on; hold on;
title("Original Signal");

%% Quantizer & Encoder
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
subplot(2,1,2);
stairs(t, yq); hold on; grid on;
title("Quantized Signal");
