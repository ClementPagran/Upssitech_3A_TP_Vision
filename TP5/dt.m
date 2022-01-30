function img=dt(img1,img2)
[li,co] = size(img1);
img = nan(li,co);
for i_li=1:li
    for i_co=1:co
        img(i_li,i_co) = img2(i_li,i_co)-img1(i_li,i_co);
    end
end
end