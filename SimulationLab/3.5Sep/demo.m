clear
close all
clc

r=0;
for x=-20:0.5:20
    r=r+1;c=0;
	for y= -20:0.5:20
        c=c+1;
		X_loc(r,c)=x;
        Y_loc(r,c)=y;
        z(r,c)=x^2+y^2;
        z1(r,c)=x^2+y^2+2*x*y;
    end
end
plot3(X_loc,Y_loc,z);
surfc(X_loc,Y_loc,z); hold on;
surfc(X_loc,Y_loc,z1); hold off;
xlabel('x');
ylabel('y');
zlabel('z');