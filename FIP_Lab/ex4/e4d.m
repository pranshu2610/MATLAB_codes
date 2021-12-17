a=imread('cameraman.tif');
subplot(3,2,1);
imshow(a);
title("Original Image");

[c,bl]=imhist(a);
subplot(3,2,2);
plot(bl,c);
title("Original Image Histogram");

A=0;
B=50;
a1=a;
for r=1:size(a,1)
    for c=1:size(a,2)
       if a(r,c) < A || a(r,c)>B
           a1(r,c)=0;
       else
           a1(r,c)=255;
       end
    end
end
subplot(3,2,3);
imshow(a1);
title("Clipped Image A=0 B=50");

A=50;
B=100;
a1=a;
for r=1:size(a,1)
    for c=1:size(a,2)
       if a(r,c) < A || a(r,c)>B
           a1(r,c)=0;
       else
           a1(r,c)=255;
       end
    end
end
subplot(3,2,4);
imshow(a1);
title("Clipped Image A=50 B=100");

A=100;
B=150;
a1=a;
for r=1:size(a,1)
    for c=1:size(a,2)
       if a(r,c) < A || a(r,c)>B
           a1(r,c)=0;
       else
           a1(r,c)=255;
       end
    end
end
subplot(3,2,5);
imshow(a1);
title("Clipped Image A=100 B=150");

A=150;
B=200;
a1=a;
for r=1:size(a,1)
    for c=1:size(a,2)
       if a(r,c) < A || a(r,c)>B
           a1(r,c)=0;
       else
           a1(r,c)=255;
       end
    end
end
subplot(3,2,6);
imshow(a1);
title("Clipped Image A=150 B=200");