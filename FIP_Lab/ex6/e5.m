clc
close all
clear

A=imread('cameraman.tif');
subplot(331);
imshow(A);
title('Original');

B=dct2(A);
subplot(332);
imshow(B);
title('DCT ');
C=idct2(B);
C=rescale(C);
subplot(333);
imshow(C);
title('Original IDCT ');

Cropped=zeros(100,100);
for i=1:100
    for j=1:100
        Cropped(i,j)=B(i,j);
    end
end
subplot(334);
imshow(Cropped);
title('Cropped DCT 100x100');
subplot(335);
CIDCT=idct2(Cropped);
CIDCT=rescale(CIDCT);
imshow(CIDCT);
title('Cropped IDCT 100x100');

Cropped=zeros(150,150);
for i=1:150
    for j=1:150
        Cropped(i,j)=B(i,j);
    end
end
subplot(336);
imshow(Cropped);
title('Cropped DCT 150x150');
subplot(337);
CIDCT=idct2(Cropped);
CIDCT=rescale(CIDCT);
imshow(CIDCT);
title('Cropped IDCT 150x150');

Cropped=zeros(50,50);
for i=1:50
    for j=1:50
        Cropped(i,j)=B(i,j);
    end
end
subplot(338);
imshow(Cropped);
title('Cropped DCT 50x50');
subplot(339);
CIDCT=idct2(Cropped);
CIDCT=rescale(CIDCT);
imshow(CIDCT);
title('Cropped IDCT 50x50');
