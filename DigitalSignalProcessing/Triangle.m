clear all
clc
N=10;
t=-5:0.001:5;
d=0;
for n=1:N
    a=8/((n*pi).^2);
    b=a*sin((n*pi)/2).^2;
    d=d+b*cos((n*pi*t)/2);
end

mean(d.^2)

plot(t,d);
xlabel('Time in Seconds');
ylabel('Function value');
title('N=10');
