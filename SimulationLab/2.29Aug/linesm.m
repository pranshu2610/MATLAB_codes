clear
close all;
clc;

x=-5:.1:5;
y1=(5-3*x)/2;
y2=-(2-2*x)/3;

plot(x,y1,'LineWidth',2);hold on;
plot(x,y2,'LineWidth',2);hold off;
xlabel('X');ylabel('Y');
legend('y_1=f(x_1)=(5-3*x)/2','y_2=f(x_2)=-(2-2*x)/3');
title('Solving two linear expressions');grid on;