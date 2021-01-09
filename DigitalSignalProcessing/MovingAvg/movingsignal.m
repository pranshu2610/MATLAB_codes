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
figure(4);
plot(x);hold on;
plot(y,'red');
plot(g);hold off;
legend('Original Signal','Noisy Signal','Moving Avg of Noise');

% g1=[];
% for m=1:length(n)
%     if m==1
%         g1(m)=(1/4)*(y(m)+y(m+1));
%     elseif m==2
%         g1(m)=(1/4)*(y(m-1)+y(m)+y(m+1));
%     elseif m==length(n)-1
%         g1(m)=(1/4)*(y(m-2)+y(m-1)+y(m));
%     elseif m==length(n)
%         g1(m)=(1/4)*(y(m-2)+y(m-1));
%     else
%         g1(m)=(1/4)*(y(m-2)+y(m-1)+y(m)+y(m+1));
%     end
% end
% 
% figure(5);
% plot(x);hold on;
% plot(y,'red');
% plot(g1);hold off;
% legend('Original Signal','Noisy Signal','Moving Avg of Noise');

