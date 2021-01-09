clear
clc
close all
[x,y]=meshgrid(-1:0.1:1);
A=1;B=A;C=B+1;
for D=C-3:0.1:C+3
    z=(D - A*x + B*y)./C;
    surfc(x,y,z);
    hold on;
end
xlabel('X');ylabel('Y');zlabel('Z');