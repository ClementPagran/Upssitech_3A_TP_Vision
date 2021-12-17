function V=haarfeature(img)
    tailleblock=size(img);
    Nofeature=0;
    V=[];
    % feature horizontale 1
    % pour toutes les largeurs possibles
    for i=1:tailleblock/2
        % pour toutes les longeurs possibles
        for j=1:tailleblock
            % pour toutes les positions en ligne
            for x=1:tailleblock -j+1
                % pour toutes les positions en colonnes
                for y=1:tailleblock-(2*i-1)
                    Nofeature=Nofeature+1;
                    resgauche = 0;
                    resdroite = 0;
                    for cptlong=x:j+x-1
                        for cptlarge=y:y+i-1
                            resgauche= resgauche+img(cptlong,cptlarge);
                            resdroite= resdroite+img(cptlong,cptlarge+i);
                        end
                    end
                    V = [V, resgauche - resdroite];
                end
            end
        end
    end
    

    % feature verticale
    for i=1:tailleblock
        % pour toutes les longeurs possibles
        for j=1:tailleblock/2
            % pour toutes les positions en ligne
            for x=1:tailleblock-(2*j-1)
                % pour toutes les positions en colonnes
                for y=1:tailleblock-(i-1)
                    Nofeature=Nofeature+1;
                    resgauche = 0;
                    resdroite = 0;
                    for cptlong=x:j+x-1
                        for cptlarge=y:y+i-1
                            resgauche= resgauche+img(cptlong,cptlarge);
                            resdroite= resdroite+img(cptlong+j,cptlarge);
                        end
                    end
                    V = [V, resgauche - resdroite];
                end
            end
        end
    end

    %feature horizontale 2
    for i=1:2
        ibis=i*2;
        % pour toutes les longeurs possibles
        for j=1:tailleblock
            % pour toutes les positions en ligne
            for x=1:tailleblock-(j-1)
                % pour toutes les positions en colonnes
                for y=1:tailleblock-(2*ibis-1)
                    Nofeature=Nofeature+1;
                    resgauche = 0;
                    resdroite = 0;
                    resmilieu = 0;
                    for cptlong=x:j+x-1
                        for cptlarge=y:(y+ibis-1)/2
                            resgauche= resgauche+img(cptlong,cptlarge);
                            resdroite= resdroite+img(cptlong,cptlarge+3*i);
                            resmilieu=resmilieu+img(cptlong,cptlarge+2*i);
                        end
                    end
                    V = [V, (resgauche + resdroite)-resmilieu];
                end
            end
        end
    end
end

% dsp2=['Bloc: ',num2str(i),'x',num2str(j),' larg x long (ixj)'];
% disp(dsp2)

% dsp1 = ['X: ',num2str(x),'| Y: ',num2str(y)];
% disp(dsp1)
