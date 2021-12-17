% WAP for intensity level quantization of grayscale image
% Explore command: multithresh() imquantize()
% Try for diff level of quantization and justify your answer

a=imread('cameraman.tif');
subplot(2,3,1);
imshow(a);
title("Original Image");

thresh=multithresh(a,2);
quant=imquantize(a,thresh);
subplot(2,3,2);
imshow(quant,[]);
title("Quantized with 2 Levels");

thresh2=multithresh(a,3);
quant2=imquantize(a,thresh2);
subplot(2,3,3);
imshow(quant2,[]);
title("Quantized with 3 Levels");

thresh3=multithresh(a,4);
quant3=imquantize(a,thresh3);
subplot(2,3,4);
imshow(quant3,[]);
title("Quantized with 4 Levels");

thresh4=multithresh(a,5);
quant4=imquantize(a,thresh4);
subplot(2,3,5);
imshow(quant4,[]);
title("Quantized with 5 Levels");

thresh5=multithresh(a,6);
quant5=imquantize(a,thresh5);
subplot(2,3,6);
imshow(quant5,[]);
title("Quantized with 6 Levels");