N=20;
h=[];
for n=-N:N  
    if n==0
        hn=1/2;
        stem(0,1/2);
    else
        hn=(sin(2*n*pi/3)-sin(n*pi/6))./(n*pi);
    end
    h =[h,hn];
end
figure(1);
stem(-N:N,h);
figure(2);
freqz(h);
