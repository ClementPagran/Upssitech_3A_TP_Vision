function somme_coeff = caracterisation (image,debut_ligne,fin_ligne,debut_colonne,fin_colonne)
somme_coeff = 0;
    for x = debut_ligne : fin_ligne
        for y = debut_colonne : fin_colonne
            somme_coeff = somme_coeff + image(x,y);
        end
    end
end