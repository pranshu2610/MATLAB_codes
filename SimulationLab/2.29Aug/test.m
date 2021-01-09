clear
close all
clc

X=[1 2 3 4 5 6 7];
Y=[60 65 70 72 65 67 62];

subplot(2,2,1);
stem(X, Y);hold on;
plot(X,Y,'r--o');hold off;
xlabel('Days');
ylabel('Price');
title('My Dollar');
legend('stem','plot');

subplot(2,2,2);
stem(X, Y);hold on;
plot(X,Y,'g--o');hold off;
xlabel('Days');
ylabel('Price');
title('My Dollar');
legend('stem','plot');

subplot(2,2,3);
stem(X, Y);hold on;
plot(X,Y,'y--o');hold off;
xlabel('Days');
ylabel('Price');
title('My Dollar');
legend('stem','plot');

subplot(2,2,4);
bar(X,Y);
xlabel('Days');
ylabel('Price');
title('My Dollar');
legend('stem','plot');