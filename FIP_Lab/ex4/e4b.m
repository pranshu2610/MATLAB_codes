a=imread('cameraman.tif');
a1=imread('pout.tif');
a2=imread('coins.png');

figure(1);
subplot(3,1,1);
imshow(a);
title("Image");

[c,bl]=imhist(a);
subplot(3,1,2);
plot(bl,c);
title("Inbuilt Histogram");

c1=zeros(1,256);
for r=1:size(a,1)
    for c=1:size(a,2)
        c1(a(r,c)+1)=c1(a(r,c)+1)+1;
    end
end
c2=[1:256];
subplot(3,1,3);
plot(c2,c1);
title("User-defined Histogram");


figure(2);
subplot(3,1,1);
imshow(a1);
title("Image");

[c,bl]=imhist(a1);
subplot(3,1,2);
plot(bl,c);
title("Inbuilt Histogram");

c1=zeros(1,256);
for r=1:size(a1,1)
    for c=1:size(a1,2)
        c1(a1(r,c)+1)=c1(a1(r,c)+1)+1;
    end
end
c2=[1:256];
subplot(3,1,3);
plot(c2,c1);
title("User-defined Histogram");

figure(3);
subplot(3,1,1);
imshow(a2);
title("Image");

[c,bl]=imhist(a2);
subplot(3,1,2);
plot(bl,c);
title("Inbuilt Histogram");

c1=zeros(1,256);
for r=1:size(a2,1)
    for c=1:size(a2,2)
        c1(a2(r,c)+1)=c1(a2(r,c)+1)+1;
    end
end
c2=[1:256];
subplot(3,1,3);
plot(c2,c1);
title("User-defined Histogram");