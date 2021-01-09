clear
close all
clc
x=-1:0.1:1;
y=-1:0.1:1;

[X,Y]=meshgrid(x,y);
Z=X.^2+Y.^2;
Z1=X.^2+Y.^2;
Z1=-Z1+2;
surfc(X,Y,Z);hold on;
surfc(X,Y,Z1);
xlabel('x');
ylabel('y');
zlabel('z');