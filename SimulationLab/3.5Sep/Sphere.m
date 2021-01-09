clear
close all
clc
N = 50;
thetaspace = linspace(0,pi,N);
phispace = linspace(0,2*pi,2*N);
[th, ph] = meshgrid(thetaspace,phispace);
R = ones(size(th)); 
r=input("Enter the length of Radius: ");
R=r.*R;
x = R.*sin(th).*cos(ph);
y = R.*sin(th).*sin(ph);
z = R.*cos(th);
xc=input("Enter the x coordinate of center: ");
yc=input("Enter the y coordinate of center: ");
zc=input("Enter the z coordinate of center: ");
X=x+xc;
Y=y+yc;
Z=z+zc;
figure;
surf(X,Y,Z);