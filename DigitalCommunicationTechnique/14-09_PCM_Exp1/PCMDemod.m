clc;
clear all;
close all;
Ts=0.01;
Td=0.5;
bn='011011100101101101101100100011010010010010010010011100100101101101101100011011010001000000000000001001010011011011011011011010001001000000000000001010010';

%% LPF & Decoding
noOfSamples = length(bn);
yRec =[]; 		% yRec is acronym for y Receieved
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

t= 0:Ts:Td;
stairs(t, yRec); hold on; grid on;

fc= 20; 			
yLP = lowpass(yRec, fc, 1/Ts);
plot(t, yLP); hold on;
title("Received Signal and Retrieved Signal");