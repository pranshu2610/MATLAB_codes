close all 
clear
clc
I = imread('cameraman.tif');
subplot(1,3,1);
imshow(I, []);
title('Original Image');
%% In-built 
B = medfilt2(I);
subplot(1,3,2);
imshow(B, []);
title('Median Inbuilt Image');
%% Userdefined
C = I;
for row=2:size(I,1)-1
    for col=2:size(I,2)-1
        S=[I(row-1,col-1),I(row-1,col),I(row-1,col+1),I(row,col-1),I(row,col),I(row,col+1),I(row+1,col-1),I(row+1,col),I(row+1,col+1)];
        S=sort(S);
        C(row,col)=median(S);
    end
end
subplot(1,3,3);
imshow(C, []);
title('Median User-defined Image');