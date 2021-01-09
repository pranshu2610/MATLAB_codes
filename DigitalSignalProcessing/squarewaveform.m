clc
clear all

subplot(2,3,1);
N=10;
t=-5:0.001:5;
f=0;
for n=1:2:N
    b=4/(n*pi)*sin((n*pi)/2);
    f=f+b*cos((n*pi*t)/2);
end

plot(t,f);      
xlabel('Time in Seconds');
ylabel('Function value');
title('N=10');

subplot(2,3,2);
N=20;
t=-5:0.001:5;
i=1;
f=0;
for n=1:N
    b=4/(n*pi)*sin((n*pi)/2);
    f=f+b*cos((n*pi*t)/2);
end

plot(t,f);      
xlabel('Time in Seconds');
ylabel('Function value');
title('N=20');

subplot(2,3,3);
N=50;
t=-5:0.001:5;
i=1;
f=0;
for n=1:N
    b=4/(n*pi)*sin((n*pi)/2);
    f=f+b*cos((n*pi*t)/2);
end

plot(t,f);      
xlabel('Time in Seconds');
ylabel('Function value');
title('N=50');

subplot(2,3,4);
N=100;
t=-5:0.001:5;
i=1;
f=0;
for n=1:N
    b=4/(n*pi)*sin((n*pi)/2);
    f=f+b*cos((n*pi*t)/2);
end

plot(t,f);      
xlabel('Time in Seconds');
ylabel('Function value');
title('N=100');

subplot(2,3,5);
N=1000;
t=-5:0.001:5;
i=1;
f=0;
for n=1:N
    b=4/(n*pi)*sin((n*pi)/2);
    f=f+b*cos((n*pi*t)/2);
end

plot(t,f);      
xlabel('Time in Seconds');
ylabel('Function value');
title('N=1000');

subplot(2,3,6);
N=50000;
t=-5:0.001:5;
i=1;
f=0;
for n=1:N
    b=4/(n*pi)*sin((n*pi)/2);
    f=f+b*cos((n*pi*t)/2);
end

plot(t,f);      
xlabel('Time in Seconds');
ylabel('Function value');
title('N=50000');
