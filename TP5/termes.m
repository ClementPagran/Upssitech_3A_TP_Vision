function [hess11,hess12,hess22,b1,b2] = termes(vois,DIDX,DIDY,DIDT)
    hess11 = 0;
    hess12 = 0;
    hess22 = 0;
    b1 = 0;
    b2 = 0;
    for i=1:vois
        for j=1:vois
            hess11 = hess11+DIDX(i,j)^2;
            hess12 = hess12+DIDX(i,j)*DIDY(i,j);
            hess22 = hess22+DIDY(i,j)^2;
            b1 = b1+DIDX(i,j)*DIDT(i,j);
            b2 = b2+DIDY(i,j)*DIDT(i,j);
        end
    end
end