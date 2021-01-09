clear
clc
i=1;
j=1;
k=1;
for a=1:50
    if(mod(a,2)==0)
        even(i)=a;
        i=i+1;
    else
        odd(j)=a;
        j=j+1;
    end
    c=0;
    if(a>1)
        for p=2:a-1
            if(mod(a,p)==0)
                c=c+1;
            end
        end
    end
    if(c==0)
        prime(k)=a;
        k=k+1;
    end
end
disp(odd);
disp(even);
disp(prime);
                