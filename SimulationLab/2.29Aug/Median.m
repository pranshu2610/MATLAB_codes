clear;
close all;
clc;
A = round(rand(1,1000)*100);
A = sort(A);
if(mod(numel(A),2)==0)
    n1=numel(A)/2;
    n2=(numel(A)+2)/2;
    N1=A(n1);
    N2=A(n2);
    med=(N1+N2)/2;
    disp(['My Calculated Median is ' num2str(med)]);
else
    n1=(numel(A)+1)/2;
    disp(['My Calculated Median is ' num2str(n1)]);
end
M2=median(A);
disp(['Inbuilt Median function result is ' num2str(M2)]);
    
    
