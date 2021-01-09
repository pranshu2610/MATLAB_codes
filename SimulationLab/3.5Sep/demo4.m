clear
clc
close all
[x,y]=meshgrid(-1:0.1:1);
A=1;B=A;C=B+1;
for D=C-2.8:0.1:C+2.8
    z=-1/C*(A*x + B*y + D);
    surfc(x,y,z);
    hold on;
end
xlabel('x');ylabel('y');zlabel('z');