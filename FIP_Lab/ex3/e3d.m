% Bilinear Interpolation Method
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
h=ones(3,3);
h=h.*0.5;
h(1,1)=h(1,1)/2;
h(3,1)=h(3,1)/2;
h(1,3)=h(1,3)/2;
h(3,3)=h(3,3)/2;
h(2,2)=1;
w=conv2(b,h);
figure(2);
imshow(w,[]);
title("Convolution Method 2x Image");

% Mathematical Fomula
d=zeros(2*size(a,1),2*size(a,2));
% LI along the rows
for r=1:size(a,1)
    for c=1:size(a,2)
        d(r,2*c)=a(r,c);
        if (c+1<size(a,2))
            d(r,2*c+1)=0.5*(a(r,c)+a(r,c+1));
        else
            d(r,2*c+1)=a(r,c);
        end
    end
end
% LI along the cols
e=d;
for r=1:size(a,1)
    for c=1:2*size(a,2)
        e(2*r,c)=d(r,c);
        if (r+1<size(a,1))
            e(2*r+1,c)=0.5*(d(r,c)+d(r+1,c));
        else
            e(2*r+1,c)=d(r,c);
        end
    end
end
figure(3);
imshow(e,[]);
title("Mathematical Method 2x Image");
