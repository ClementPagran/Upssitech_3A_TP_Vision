function img=dx(img_in)
[li,co] = size(img_in);
img = nan(li-1,co);
for i_li=1:li-1
    for i_co=1:co
        img(i_li,i_co) = img_in(i_li+1,i_co)-img_in(i_li,i_co);
    end
end
end