function [minimum, indice_min] = similaire (num_image,signature,nbimg)
    distance = [];
    for nb_image = 1 : nbimg
        if( nb_image ~= num_image)
            distance = [distance man_Dist(num_image,nb_image,signature)];
        else 
            distance = [distance 100000] ;
        end
    end
   [minimum,indice_min]= min(distance);  
end