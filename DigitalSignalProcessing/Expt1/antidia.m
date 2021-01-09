clc
close all
a=zeros(15);
for i=1:15
    a(i,16-i)=3*i;
end
disp(a);
