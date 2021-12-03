function [xo,yo]=barycentre(img)
[x,y]=size(img);
cpt=0;
adx=0;
ady=0;
for i=1:x
    for j=1:y
        if img(i,j)==0
            adx=adx+i;
            ady=ady+j;
            cpt=cpt+1;
        end         
    end
end
xo=round(adx/cpt);
yo=round(ady/cpt);
end

