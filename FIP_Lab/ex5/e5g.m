close all 
clear
clc
I = imread('pout.tif');
subplot(1,2,1);
imshow(I, []);
title('Original Image');
%% User-defined histeq
M=size(I,1);
N=size(I,2);
L=255;

% Generating Histogram Array
c1=zeros(1,256);
for r=1:size(I,1)
    for c=1:size(I,2)
        c1(I(r,c)+1)=c1(I(r,c)+1)+1;
    end
end

% Histogram Equalization : Where Index represent Original Intensity and
% Value Represents Normalized Intensity
S=c1;
for r=1:size(c1,2)
    c2=c1(1:r);
    nj=sum(c2);
    S(1,r)=((L-1)*nj)/(M*N);
end

% Replacing Original Intensity with Normalized Intensity
HistEquiImg = I;
for r=1:size(I,1)
    for c=1:size(I,2)
        HistEquiImg(r,c)=S(I(r,c));
    end
end
subplot(1,2,2);
imshow(HistEquiImg);
title("User-defined Histogram Equalization");