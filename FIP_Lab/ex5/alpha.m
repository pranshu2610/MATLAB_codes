close all 
clear
clc
I = imread('cameraman.tif');
subplot(1,3,1);
imshow(I, []);
title('Original Image');
%% Alpha Trimmed Mean Filter 
B = I;
d=4;
for row=2:size(I,1)-1
    for col=2:size(I,2)-1
        S=[I(row-1,col-1),I(row-1,col),I(row-1,col+1),I(row,col-1),I(row,col),I(row,col+1),I(row+1,col-1),I(row+1,col),I(row+1,col+1)];
        S=sort(S);
        S=S(d+1:(9-d));
        divFactor=9-d;
        B(row,col)=round((1/d)*sum(S));
    end
end
subplot(1,3,2);
imshow(B, []);
title('Alpha Trimmed Mean Filter with d=');