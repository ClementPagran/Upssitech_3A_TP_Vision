function [index,se]=threshold(F,V)
T = [F,V];
Len = 1000;

sortedT = sortrows(T,1);
sorted_flags = sortedT(:,2);
sorted_feature = sortedT(:,1);


least_error = 9999999999999999999999999999999999999999;
Best_index = 1;
for pos_seuil = 1:Len
    
    sorted_flags_inv=sorted_flags==0;
    error1 = sum(sorted_flags_inv(1:pos_seuil));
    error2 = sum(sorted_flags(pos_seuil:Len));
    E1 = error1+error2;
    
    error1 = sum(sorted_flags(1:pos_seuil));
    error2 = sum(sorted_flags_inv(pos_seuil:Len));
    E2 = error1+error2;

    E = min(E1,E2);
    
    if(least_error>=E)
        least_error = E;
        Best_index = pos_seuil;
    end
    
end

se = sorted_feature(Best_index);
index = Best_index;
end

