function [s,pos]=threshold(F,V)
nb_indiv = size(F);
nb_indiv = nb_indiv(1);
F = F';
V = V';
Tab = [F;V]; %2 lignes(feature, etiquette), 1000 colonnes (individus)
Tab = sortrows(Tab')';
err = inf;
t = 0;
tm = nb_indiv-sum(Tab(2,:));%nombre total non visages
tp = nb_indiv-tm;%nombre total de visages
for thres = 1:nb_indiv-1
    sp = sum(Tab(2:2,1:thres));%nombre visages jusqu'au seuil
    sm = thres - sp; % nombre de non visages jusqu'au seuil
    err1 = sp + tm - sm;
    err2 = sm+tp-sp;
    err_t = min([err1,err2]);
    if(err_t<err)
        err = err_t;
        t = thres;
    end
end
pos = t;
s = Tab(1,pos);
end

