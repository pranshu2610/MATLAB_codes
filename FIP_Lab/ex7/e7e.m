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
%% Complement of Opening and Closing Op
se_circle = strel('disk',2);
open_op = imopen(I, se_circle);
close_op = imclose(I, se_circle);

comp_open_op=imcomplement(open_op);
subplot(2,3,2);
imshow(comp_open_op);
title("Complement of Open Operation");

comp_close_op=imcomplement(close_op);
subplot(2,3,3);
imshow(comp_close_op);
title("Complement of Close Operation");

%% Open and Close Operation of Image Complement
close_op_comp=imdilate(I_comp, se_circle);
subplot(2,3,5);
imshow(close_op_comp);
title("Close Operation of Image Complement");

open_op_comp=imerode(I_comp, se_circle);
subplot(2,3,6);
imshow(open_op_comp);
title("Open Operation of Image Complement"); 