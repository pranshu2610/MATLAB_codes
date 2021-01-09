clc
close all
a=randi(2,4)
b=randi(2,4)
p=a.';
fprintf('transpose of matrix A :');
p

J=zeros(4);
for i =1:4
    for j=1:4
        J(i,j)=0;
        for k =1:4
            J(i,j)=J(i,j)+a(i,k)*b(k,j);
        end
    end
end
fprintf('matrix multiplication:');
J
 
p=zeros(4);
for i =1:4
    for j=1:4
        p(i,j)=a(i,j)*b(i,j);
    end
end
fprintf('dot product');
p
