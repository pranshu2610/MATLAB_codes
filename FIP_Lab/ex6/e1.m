clc;
close all;
clear all;
A=zeros(256,256);
A(103:153,103:153)=1;
subplot(321)
imshow(A)
title('first image')
B=ones(256,256);
B(87:167,87:167)=0;
subplot(322)
imshow(B)
title('second image')
C=conv2(A,B,'same');
subplot(323)
imshow(uint8(C));
title('convoluted image in built')
D=fft2(double(A));
E=fft2(double(B));
F=D.*E;
G=ifft2(F);
G=fftshift(G);
subplot(324)
imshow(uint8(G));
title('convoluted image using DFT');
subplot(325)
imshow(D);
title('FFT of Img 1')
subplot(326)
imshow(E);
title('FFT of Img 2')