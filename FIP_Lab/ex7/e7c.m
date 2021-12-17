clc;
close all;
clear all;
I = imread("coins.png");
%% Original Image
subplot(2, 3, 1);
imshow(I);
title("Original image");

%% Opening and Closing Built-in Operation
se_circle = strel('disk',10);
open_operation=imopen(I,se_circle);
subplot(2, 3, 2);
imshow(open_operation);
title("Opening Operation - Builtin");

close_operation=imclose(I,se_circle);
subplot(2, 3, 3);
imshow(close_operation);
title("Closing Operation - Builtin");

%% Opening and Closing User-defined Operation
dilate = imdilate(I, se_circle);
erode = imerode(I, se_circle);
open_1=imdilate(erode, se_circle);
subplot(2, 3, 5);
imshow(open_1);
title("Opening Operation - User Defined");

close_1=imerode(dilate, se_circle);
subplot(2, 3, 6);
imshow(close_1);
title("Closing Operation - User Defined");