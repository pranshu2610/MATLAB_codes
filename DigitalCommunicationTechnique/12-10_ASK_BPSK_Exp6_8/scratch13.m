bn = '01011100';
ln = length(bn);
Ts = 0.001;
Tb = 1;
t = 0:Ts:Tb-Ts;
p1 = ones(1,length(t));
yo = [];
for n=1:ln
    if bn(n)=='1'
        y=p1;
    elseif bn(n) =='0'
        y=-1*p1;
    end
    yo = [yo, y];
end
t=0:Ts:(ln*Tb)-Ts;
c = sin(2*pi*5*t);
yMod = yo.*c;
plot(t,yMod);