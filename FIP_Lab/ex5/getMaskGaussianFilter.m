function mat = getMaskGaussianFilter(dimen,var)
    mat = zeros(dimen,dimen);
    a=1/((2*pi)^(0.5)*var);
    subVal=round(dimen/2);
    for row=1:dimen
        for col=1:dimen
            mat(row,col)=a*exp((-1/2)*(((row-subVal)^2+(col-subVal)^2)/(var^2)));
        end
    end
    mat
end