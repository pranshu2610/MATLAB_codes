N=100;
N1=50;
h1=[];
h2=[];

for n=-N1:N1  
    if n==0
        hn=1/2;
        stem(0,1/2);
    else
        hn=(sin(2*n*pi/3)-sin(n*pi/6))./(n*pi);
    end
    h1 =[h1,hn];
end
for n=0:N  
    if n==0
        hn=1/2;
        stem(0,1/2);
    else
        hn=(sin(2*n*pi/3)-sin(n*pi/6))./(n*pi);
    end
    h2 =[h2,hn];
end

figure(1);
freqz(h1); hold on;
freqz(h2); hold off;


m=0:400;

x=sin(m*pi/3);
% x=sin(m*pi/8);
% x=sin(m*0.8*pi);
% x=sin(m*pi/6);


y1=conv(x,h1);
y2=conv(x,h2);


figure(2);
plot(x);
figure(3);
plot(y1);hold on;
plot(y2);



