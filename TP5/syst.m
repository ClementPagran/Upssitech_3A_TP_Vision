function [vx,vy,mask] = syst(img1,img2,seuil,vois)
    [li,co] = size(img1);
    n = vois/2-0.5;
    vx = nan(li-2*n,co-2*n);
    vy = nan(li-2*n,co-2*n);
    DIDX = dx(img1);
    DIDY = dy(img1);
    DIDT = dt(img1,img2);
    mask = ones(li-2*n,co-2*n);
    for i_li=n+1:li-(n+1)
        for i_co=n+1:co-(n+1)
            [hess11,hess12,hess22,b1,b2] = termes(vois,DIDX(i_li-n:i_li+n,i_co-n:i_co+n),DIDY(i_li-n:i_li+n,i_co-n:i_co+n),DIDT(i_li-n:i_li+n,i_co-n:i_co+n));
            vxvy = -1*[hess11,hess12;hess12,hess22]\[b1;b2];
            if (eig([hess11,hess12;hess12,hess22])>=seuil)
            vx(i_li-1,i_co-1) = vxvy(1);
            vy(i_li-1,i_co-1) = vxvy(2);
            else
                mask(i_li-1,i_co-1) = 0;
            end
        end
    end
end