clc;
close all;
clear all;
I = imread("coins.png");
I_comp=imcomplement(I);
%% Original Image
subplot(2, 3, 1);
imshow(I);
title("Original image");
subplot(2, 3, 4);
imshow(I_comp);
title("Image Complement");
%% Complement of Erosion and Dilation
se_circle = strel('disk',2);
dilate = imdilate(I, se_circle);
erode = imerode(I, se_circle);

comp_dilate=imcomplement(dilate);
subplot(2,3,2);
imshow(comp_dilate);
title("Complement of Dilation");

comp_erode=imcomplement(erode);
subplot(2,3,3);
imshow(comp_erode);
title("Complement of Erosion");

%% Erosion and Dilation of Image Complement
dilate_comp=imerode(I_comp, se_circle);
subplot(2,3,5);
imshow(dilate_comp);
title("Erosion of Image Complement");

erode_comp=imdilate(I_comp, se_circle);
subplot(2,3,6);
imshow(erode_comp);
title("Dilation of Image Complement"); 