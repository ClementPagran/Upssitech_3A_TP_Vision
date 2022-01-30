function V=espace_de_vote(img)

    figure();
    subplot(1,2,1)
    imshow(img);
    title("Image binaire")
    img=~img;
    [x, y]=size(img); 
    diag = round(sqrt(x.^2 + y.^2));
    V = zeros(diag,628);
    for i=1:x
        for j=1:y
          if (img(i,j)==1)
            for teta=1:628        
                ro=round(i*cos(teta/100) + j*sin(teta/100)); 
                if(ro> 0 && ro < diag)
                    V(ro,teta)=V(ro,teta)+1;
                end
            end
          end
        end
    end
    subplot(1,2,2)
    imagesc(log(V+1));
    axis equal;
    colormap(gray(256));
    title("Voting Space")

end

