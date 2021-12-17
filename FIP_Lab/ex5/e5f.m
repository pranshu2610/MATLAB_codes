close all 
clear
clc
I = imread('cameraman.tif');
subplot(1,3,1);
imshow(I, []);
title('Original Image');
%% Predefined 
U = fspecial('unsharp');
unsharp = imfilter(I,U,'replicate');
subplot(1,3,2);
imshow(unsharp, []);
title('Unsharp Image using Predefined function');
%% User-defined 
G = I;
HPF=[0,1,0;1,-4,1;0,1,0];
G2=conv2(I,HPF);
for row=1:size(I,1)
    for col=1:size(I,2)
        G(row,col)=I(row,col)-G2(row,col);
    end
end
subplot(1,3,3);
imshow(G,[]);
title('Unsharp Image using User-defined function');