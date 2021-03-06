N=50;
h=[];

for n=0:N  
    if n==0
        hn=1/2;
        stem(0,1/2);
    else
%         hn=(sin(2*n*pi/3)-sin(n*pi/6))./(n*pi);
        hn=(sin(n*pi/6)/(n*pi));
    end
    h =[h,hn];
end

figure(1);
stem(0:N,h);
figure(2);
freqz(h);


m=0:400;

% x=sin(m*pi/3);
% x=sin(m*pi/8);
x=sin(m*0.8*pi);
% x=sin(m*pi/6);


y=conv(x,h);

figure(3);
plot(x);
figure(4);
plot(y);
