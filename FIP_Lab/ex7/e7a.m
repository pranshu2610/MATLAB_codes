clc; 
close all;
clear all;
I = imread("coins.png");
I2 = imread("rice.png");
%% Original Images
subplot(5, 2, 1);
imshow(I);
title("Original Image 1");
subplot(5, 2, 2);
imshow(I2);
title("Original Image 2");


%% Line Dilate
se = strel("line", 10,0);
dilate = imdilate(I, se);
subplot(5, 2, 3);
imshow(dilate);
title("Dilated Image 1 using line");

dilate = imdilate(I2, se);
subplot(5, 2, 4);
imshow(dilate);
title("Dilated Image 2 using line");

%% Line Erode
erode = imerode(I, se);
subplot(5, 2, 5);
imshow(erode);
title("Eroded Image 1 using line");

erode = imerode(I2, se);
subplot(5, 2, 6);
imshow(erode);
title("Eroded Image 2 using line");

%% Cirle Dilate
se_circle = strel('disk',10);
dilate = imdilate(I, se_circle);
subplot(5, 2, 7);
imshow(dilate);
title("Dilated Image 1 using circle");

dilate = imdilate(I2, se_circle);
subplot(5, 2, 8);
imshow(dilate);
title("Dilated Image 2 using circle");

%% Circle Erode
erode = imerode(I, se_circle);
subplot(5, 2, 9);
imshow(erode);
title("Eroded Image 1 using circle");

erode = imerode(I2, se_circle);
subplot(5, 2, 10);
imshow(erode);
title("Eroded Image 2 using circle");