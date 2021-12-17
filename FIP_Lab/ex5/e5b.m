%% Original Image
I = imread('cameraman.tif');
subplot(2,2,1);
imshow(I);
title('Original Image');
%% Gaussian Filter
B=imgaussfilt(I,2);
subplot(2,2,2);
imshow(I);
title('Gaussian Filter');
%% 3*3 mask gaussian filter
H=getMaskGaussianFilter(3,2);
c = filter2(H, I);
subplot(2, 2, 3)
imshow(c,[])
title('3x3 Mask Gaussian function')
%% 5*5 mask gaussian filter
H = getMaskGaussianFilter(5,2);
d = filter2(H, I);
subplot(2, 2, 4)
imshow(d,[])
title('5x5 mask Gaussian function')