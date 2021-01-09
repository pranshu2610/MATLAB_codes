clear;
close all;
clc;

y=[12 31 43 1 2 3 4 56 7 9];
m=sum(y)/numel(y);
disp(['My calc of mean is : ' num2str(m)])
mean(y)
median(y)
[mx,lc1] = max(y)