clc
close all
clear

order = input("Enter the order : ");
if order==0
    disp(1)
else
    H=1/sqrt(2)*[1 1;1 -1];
    for i=(2:order)
        H=[H H;H -H]*(1/sqrt(2));
    end
    disp(H);
end
