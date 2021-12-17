a=imread('pout.tif');
subplot(1,2,1);
imshow(a);
title("Original Image");

subplot(1,2,2);
b=histeq(a);
imshow(b);
title("Histogram Equalized Image");