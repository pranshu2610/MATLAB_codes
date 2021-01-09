clc
clear all

n=10;
w=pi/2;
t = -5:.01:5;
y = zeros(1,length(t));
for k = 1:2:n
   a=4/(pi*k);
   y = y + a*sin(w*k*t);
end
plot(t,y);
axis([-5 5 -1.5 1.5]);
xlabel('Time in Seconds');
ylabel('Function value');
title('N=10');
