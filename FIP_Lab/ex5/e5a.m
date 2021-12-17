I = imread('cameraman.tif');
subplot(2,3,1);
imshow(I);
title('Original Image');

%% 3*3 mean filter
m33 = (1/9)*ones(3,3);
J = imfilter(I, m33);
subplot(2,3,2);
imshow(J);
title('3*3 mean filter');

%% 3*3 weighted mean filter
mw33=(1/16)*[1,2,1; 2,4,2; 1,2,1];
L=imfilter(I,mw33);
subplot(2,3,3);
imshow(L);
title('3*3 weighted mean filter');
%% 5*5 mean filter
m55 = (1/25)*ones(5,5);
K = imfilter(I, m55);
subplot(2,3,4);
imshow(K);
title('5*5 mean filter');

%% 5*5 Bartlett filter
bart=(1/81)*[1,2,3,2,1; 2,4,6,4,2; 3,6,9,6,3; 2,4,6,4,2; 1,2,3,2,1]; 
M=imfilter (I,bart);
subplot(2,3,5);
imshow(M);
title("5*5 Bartlett filter");