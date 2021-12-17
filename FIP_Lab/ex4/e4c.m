a=imread('cameraman.tif');

figure(1);
subplot(2,2,1);
imshow(a);
title("Image");

[c,bl]=imhist(a);
subplot(2,2,2);
plot(bl,c);
title("Original Histogram");

a1=a;
for r=1:size(a,1)
    for c=1:size(a,2)
       if a(r,c) > 150
           a1(r,c)=255;
       elseif a(r,c)<100
           a1(r,c)=0;
       else
           a1(r,c)=a(r,c);
       end
    end
end
subplot(2,2,3);
imshow(a1);
title("Threshold Image");

[c,bl]=imhist(a1);
subplot(2,2,4);
plot(bl,c);
title("Threshold Histogram");