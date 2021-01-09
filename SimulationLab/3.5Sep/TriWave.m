clear
clc
close all
ts=input("Enter time period: ");
x=0:ts;
a=input("Enter Peak to Peak Amplitude: ");
p=4;
b=mod(x,p);
b=b-p/2;
for i=1:numel(b)
    if(b(i)<0)
        b(i)=-b(i);
    end
end
y=((2*a)./p)*b-(a/2);
plot(x,y,'red');
title('TRIANGULAR WAVE');
xlabel('X');ylabel('Y');