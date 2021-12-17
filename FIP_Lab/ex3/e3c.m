% Replication Method
a=imread('cameraman.tif');
figure(1);
imshow(a);
title("Original Image");

% Convolution Method
b=zeros(2*size(a,1),2*size(a,2));
for r=1:size(a,1)
    for c=1:size(a,2)
        b(2*r-1,2*c-1)=a(r,c);
    end
end
h=ones(2,2);
w=conv2(b,h);
figure(2);
imshow(w,[]);
title("Convolution Method 2x Image");

% Mathematical Fomula
d=zeros(2*size(a,1),2*size(a,2));
for r=1:size(a,1)
    for c=1:size(a,2)
        d(2*r-1,2*c-1)=a(r,c);
        d(2*r,2*c-1)=a(r,c);
        d(2*r-1,2*c)=a(r,c);
        d(2*r,2*c)=a(r,c);
    end
end
figure(3);
imshow(d,[]);
title("Mathematical Method 2x Image");