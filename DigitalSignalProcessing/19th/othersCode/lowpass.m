close all
clear
clc
%figure(1);
%subplot(3,1,1);
n1 = 100;
n2 = 100;
n = -n1:n2;
h = (sin((n*pi)/5))./(n*pi);
h(n1+1) = 0.2;
%stem(n, h);
%xlabel('Period');
%ylabel('Function value');
figure('Name', num2str(n2));
freqz(h);

%figure(1);
%subplot(3,1,2)
n1 = 10000;
n2 = 10000;
n = -n1:n2;
h = (sin((n*pi)/5))./(n*pi);
h(n1+1) = 0.2;
%stem(n, h);
%xlabel('Period');
%ylabel('Function value');
figure('Name', num2str(n2));
freqz(h);

%figure(1);
%subplot(3,1,3)
n1 = 0;
n2 = 10000;
n = -n1:n2;
h = (sin((n*pi)/5))./(n*pi);
h(n1+1) = 0.2;
%stem(n, h);
%xlabel('Period');
%ylabel('Function value');
figure('Name', num2str(n2));
freqz(h);