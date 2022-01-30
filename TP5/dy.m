function img=dy(img_in)
[li,co] = size(img_in);
img = nan(li,co-1);
for i_li=1:li
    for i_co=1:co-1
        img(i_li,i_co) = img_in(i_li,i_co+1)-img_in(i_li,i_co);
    end
end
end