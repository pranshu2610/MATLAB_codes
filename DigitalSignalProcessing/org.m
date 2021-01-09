clear 
clc
e=-5:0.001:5;
d=zeros(1,length(e));
i=1;
for t=-5:0.001:5
    c=0;
    for n=1:10
        a=8/(n*n*pi*pi);
        b=a*sin((n*pi)/2)*sin((n*pi)/2);
        c=c+b*cos((n*pi*t)/2);
        d(i)=c;
    end
    i=i+1;
end
plot(e,d); hold on
title('N=10')
