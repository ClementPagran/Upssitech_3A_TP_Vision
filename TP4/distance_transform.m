function [img_large] = distance_transform(img_bin,chanfrein)
    dist_transf=img_bin;
    %Initialisation
    [x,y]=size(dist_transf);
    for i=1:x
        for j=1:y
            if dist_transf(i,j)==1
                dist_transf(i,j)=0;
            else
                dist_transf(i,j)=inf;
            end
        end
    end   
    img_large=inf(x+2,y+2);
    for i=2:x
        for j=2:y
            img_large(i,j)=dist_transf(i,j);
        end
    end
    for i=2:x+1
        for j=2:y+1
            add1=chanfrein(1,1)+img_large(i-1,j-1);
            add2=chanfrein(1,2)+img_large(i-1,j);
            add3=chanfrein(1,3)+img_large(i-1,j+1);
            add4=chanfrein(2,1)+img_large(i,j-1);
            add5=chanfrein(2,2)+img_large(i,j);
            list=[add1 add2 add3 add4 add5];
            img_large(i,j)=min(list);
        end
    end
    for i=x+1:-1:2
        for j=y+1:-1:2
            add1=chanfrein(3,3)+img_large(i+1,j+1);
            add2=chanfrein(3,2)+img_large(i+1,j);
            add3=chanfrein(3,1)+img_large(i+1,j-1);
            add4=chanfrein(2,3)+img_large(i,j+1);
            add5=chanfrein(2,2)+img_large(i,j);
            list=[add1 add2 add3 add4 add5];
            img_large(i,j)=min(list);
        end
    end
end

