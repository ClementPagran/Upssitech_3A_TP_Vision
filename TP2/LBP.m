function [descriptor] = LBP(image,interestPoints)

size_=size(interestPoints);
descriptor=[];
count=0;

for i=1:size_(1)
    point=interestPoints(i,:);
    x=point(2);
    y=point(1);
 
    descriptor_n=[];
    count=0;
    %la taille de la fenetre est 5*5 pour pouvoir avoir 24 pixels voisin au
    %pixel central
    for a=-2:1:2
        for b=-2:1:2         
            if(a~=0 && b~=0)
               diff=image(x,y)-image(x+a,y+b);
               count=count+1;
               if (diff >0 )
                   descriptor_n=[descriptor_n 1];
                else
                   descriptor_n=[descriptor_n 0];
                end         
            end
        end
    end  
    descriptor=[descriptor; descriptor_n];
end