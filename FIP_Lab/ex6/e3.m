clc
close all
clear

A=imread('cameraman.tif');
subplot(221);
imshow(A);
title('Image 1')

B=imread('pout.tif');
subplot(222);
imshow(B);
title('Image 2')

[r1, c1] = size(A);
[r2, c2] = size(B);
rows = max(r1,r2);
cols = max(c1,c2);
img1fft=fft2(A, rows, cols);
img2fft=fft2(B, rows, cols);
mag1 = abs(img1fft);
mag2 = abs(img2fft);
pha1 = angle(img1fft);
pha2 = angle(img2fft);
out1 = mag1 .* exp(1i*pha2);
out2 = mag2 .* exp(1i*pha1);

out1 = (ifft2(out1));
subplot(2,2,3);
imshow(out1,[]);
title('Image 1 with phase of img 2')

out2 = (ifft2(out2));
subplot(2,2,4);
imshow(out2,[]);
title('Image 2 with phase of img 1')