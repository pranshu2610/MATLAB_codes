clear;
close all;
clc;

A = round(rand(1,1000)*100);
M1=A(1);
N1=A(1);
for a=2:1000
    if(M1<A(a))
        M1=A(a);
    end
    if(N1>A(a))
        N1=A(a);
    end
end
disp(['My Max Value is '  num2str(M1)]);
disp(['My Min Value is '  num2str(N1)]);

M2 = max(A);
N2 = min(A);
disp(['Inbuilt Max Function result is ' num2str(M2)]);
disp(['Inbuilt Min Function result is ' num2str(N2)]);

