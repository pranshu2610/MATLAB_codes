clc
clear all

N=1000;
t=-2:0.01:2;
f=0;
for n=1:2:N
    b=4/(n*pi)*sin((n*pi)/2);
    f=f+b*cos((n*pi*t)/2);
end
mean(f.^2)

plot(t,f);      
xlabel('Time in Seconds');
ylabel('Function value');
title('N=10');