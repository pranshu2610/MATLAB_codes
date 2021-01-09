clear all
clc
N1=6;
N2=4;
x=rand(1,N1);
h=rand(1,N2);
n=N1+N2;
y=zeros(1,n);
for i=1:n
    for k=1:i
        if (k<=N1 & (i-k)<=N2 & (i-k)>0)
            y(i)=y(i)+x(k)*h(i-k);
        end
    end
end
y=y(2:n);
disp(y)
conv(x,h)
