function distance = dianstance_manhattan(num_image1,num_image2,signature)
   distance = sum(abs(signature(num_image1,:)-signature(num_image2,:)));
end