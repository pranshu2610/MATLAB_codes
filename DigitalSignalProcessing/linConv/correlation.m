clear all
clc
N1=3;
N2=3;
x=[3 1 2];
h=[1 2 1];
n=N1+N2;
y=zeros(1,n);
for i=1:n
    for k=1:n-i
        if (k<=N1 & (i+k)<=N2)
            y(i)=y(i)+x(k)*h(k+i);    
        end
    end
end
y=y(1:n);
xcorr(x,h)
disp(y)
