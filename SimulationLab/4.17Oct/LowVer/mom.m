clear
close all
clc

ii = -1:0.2:1;
jj = ii;

for p=1:numel(ii)
    for q=1:numel(jj)
        i = ii(p);
        j = jj(q);
        sim('my_model');
        
        iii(p,q) = i;
        jjj(p,q)=j;
        [p q]
    end
end
kk = iii.^2+jjj.^2;
plot3(iii,jjj,kk);