% WAP to increase the size of image to double of its original using nearest neig
a=imread('peppers.png');
figure(1);
imshow(a);
title("Original Image");

b=imresize(a,2);
figure(2);
imshow(b)
title("Increased Image Size 2 times");

c=imresize(a,0.5);
figure(3);
imshow(c)
title("Decreased Image Size 2 times");
