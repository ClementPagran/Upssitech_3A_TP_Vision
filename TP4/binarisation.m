function [imgret] = binarisation(img)
imgret=img(:,:,1);
imgret=double(imgret);
[x,y]=size(imgret);
    for i=1:x
        for j=1:y
            imgret(i,j)=imgret(i,j)<100;
        end
    end
end

