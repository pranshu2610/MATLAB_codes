clear
clc
N=50;
thetaspace=linspace(0,pi,N);
phispace=linspace(0,2*pi,2*N);
[ts,ps]=meshgrid(thetaspace,phispace);
r=ones(size(ts));
R=10.*r;
x=R.*sin(ts).*cos(ps);
y=R.*sin(ts).*sin(ps);
z=R.*cos(ts);
figure
surf(x,y,z);