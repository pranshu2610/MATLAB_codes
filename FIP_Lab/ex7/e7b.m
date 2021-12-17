clc; 
close all;
clear all;
I = imread("coins.png");
%% Original
subplot(2, 2, 1);
imshow(I);
title("Original image");
%% Edges Erode
se_circle = strel('disk',5);
erode = imerode(I, se_circle);
edge=I-erode;
subplot(2, 2, 2);
imshow(edge);
title("Edges with Erode");
%% Edges Dilate
dilate = imdilate(I, se_circle);
edge=dilate-I;
subplot(2, 2, 3);
imshow(edge);
title("Edges with Dilation");
%% Edges Both
edge=dilate-erode;
subplot(2, 2, 4);
imshow(edge);
title("Edges with Erode and Dilation");