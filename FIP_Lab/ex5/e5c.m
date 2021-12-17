close all 
clear
clc
I = imread('cameraman.tif');
subplot(2,3,1);
imshow(I, []);
title('Original Image');

%%
NI = imnoise(I,'salt & pepper');
subplot(2,3,2);
imshow(NI, []);
title('Noisy Image');

%%
f = 1/3*ones(3,1);
F = f*f';
O = filter2(F, NI);
subplot(2,3,3);
imshow(O, []);
title('3X3 mean filter');

f = 1/5*ones(5,1);
F = f*f';
O = filter2(F, NI);
subplot(2,3,4);
imshow(O, []);
title('5X5 mean filter');

f = 1/9*ones(3,3);
F = conv2(f,f);
O = filter2(F, NI);
subplot(2,3,5);
imshow(O, []);
title('5X5 Bartlett mean filter');