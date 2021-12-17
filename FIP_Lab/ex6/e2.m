close all 
clear
clc
white=ones(80,80);
a=padarray(white,[88,88]);
b=imrotate(a,60,'bilinear','crop');
a1=abs(fftshift(fft2(a)));
b1=abs(fftshift(fft2(b)));
subplot(221);
imshow(a);
title("Original Image");

subplot(222);
imshow(b);
title("Rotated by 60 deg");

subplot(223);
imshow(a1);
title('Orginal Img Spectrum');

subplot(224);
imshow(b1);
title('Rotated Img Spectrum');
