clear
close all
clc
xc=input("Enter the x coordinate of center: ");
yc=input("Enter the y coordinate of center: ");
zc=input("Enter the z coordinate of center: ");
L=10;
alpha=0.8;
X = [0 0 0 0 0 1; 1 0 1 1 1 1; 1 0 1 1 1 1; 0 0 0 0 0 1];
Y = [0 0 0 0 1 0; 0 1 0 0 1 1; 0 1 1 1 1 1; 0 0 1 1 1 0];
Z = [0 0 1 0 0 0; 0 0 1 0 0 0; 1 1 1 0 1 1; 1 1 1 0 1 1];
C='yellow';
X = L*(X-0.5) + xc;
Y = L*(Y-0.5) + yc;
Z = L*(Z-0.5) + zc;
fill3(X,Y,Z,C,'FaceAlpha',alpha);
axis equal
