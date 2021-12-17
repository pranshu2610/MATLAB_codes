a=imread('moon.tif');
subplot(2,3,1);
imshow(a);
title("Original Image");

b=a;
for r=1:size(b,1)
    for c=1:size(b,2)
        b(r,c)=255-a(r,c);
    end
end
subplot(2,3,2);
imshow(b);
title("Complement Image Transformation");

d=double(a)/255;
c=50;
e=c*log(1+d);
subplot(2,3,3);
imshow(e);
title("Logarithmic Transformation");

d=double(a)/255;
c=50;
gamma=1.2;
e=c*(d).^gamma;
subplot(2,3,4);
imshow(e);
title("Power Law Transformation Gamma 1.2");

gamma=1.3;
e=c*(d).^gamma;
subplot(2,3,5);
imshow(e);
title("Power Law Transformation Gamma 1.3");

gamma=1.4;
e=c*(d).^gamma;
subplot(2,3,6);
imshow(e);
title("Power Law Transformation Gamma 1.4");