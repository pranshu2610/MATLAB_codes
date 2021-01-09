bn = '10010010';
ln = length(bn);
Tb=1;
Ts=0.01;
t=0:Ts:Tb-Ts;
p0 = zeros(1,length(t));
p1 = ones(1,length(t));
yo=[];
for n = 1:ln
    if bn(n) == '1'
        y=p1;
    elseif bn(n) == '0'
        y=p0;
    end
    yo=[yo,y];
end
t= 0:Ts:ln*Tb-Ts;
c=sin(2*pi*5*t);
yMod = yo.*c;
plot(t,yMod);