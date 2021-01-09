clear
clc
i=1;
j=1;
l=1;
for a=1:50
    if(mod(a,2)==0)
        even(i)=a;
        i=i+1;
    elseif(mod(a,2)==1)
        odd(j)=a;
        j=j+1;
    end
    c=0;
    for p=2:a-1
        if(mod(a,p)==0)
            c=c+1;
        end
    end
    if(c==0)
        prime(l)=a;
        l=l+1;
    end
end
disp("Even Numbers are : ");
disp(even)
disp("Odd Numbers are : "); 
disp(odd)
disp("Prime Numbers are : "); 
disp(prime)  


