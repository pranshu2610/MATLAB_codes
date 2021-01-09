clear all
clc
n=0:100;
x=sin(0.5*n);
figure(1);
plot(x);
y=rand(1,length(n));
y=x+y;
figure(2);
plot(y);
g=[];
for m=1:length(n)
    if m==1
        g(m)=(1/3)*(y(m)+y(m+1));
    elseif m==length(n)
        g(m)=(1/3)*(y(m-1)+y(m));
    else
        g(m)=(1/3)*(y(m-1)+y(m)+y(m+1));
    end
end
figure(3);
plot(g);