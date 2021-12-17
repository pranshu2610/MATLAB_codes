close all 
clear
clc
I = imread('cameraman.tif');
subplot(2,3,1);
imshow(I, []);
title('Original Image');

NI = imnoise(I,'salt & pepper');
subplot(2,3,2);
imshow(NI, []);
title('Noisy Image');
%% Min, Max and Midpoint Filter 
B = NI;
C = NI;
D = NI;
for row=2:size(NI,1)-1
    for col=2:size(NI,2)-1
        S=[NI(row-1,col-1),NI(row-1,col),NI(row-1,col+1),NI(row,col-1),NI(row,col),NI(row,col+1),NI(row+1,col-1),NI(row+1,col),NI(row+1,col+1)];
        S=sort(S);
        B(row,col)=S(1);
        C(row,col)=S(end);
        D(row,col)=(S(1)+S(end))/2;
    end
end
subplot(2,3,3);
imshow(B, []);
title('Min Filter Image');
subplot(2,3,4);
imshow(C, []);
title('Max Filter Image');
subplot(2,3,5);
imshow(D, []);
title('Midpoint Filter Image');