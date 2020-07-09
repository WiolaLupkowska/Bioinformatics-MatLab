function [align1,align2] = path_L3(V,sequence1, sequence2,pair,scoring,gap)
%Funckcja tworzaca sciezke optymalnego dopasowania

%pair- komorka zwierajaca jedno ze znalezionych maximow(zabezpieczenie na wypadek, gdyby maximow bylo wiecej niz 1)
arr=cell2mat(pair);                                                                     %1

%rozpoczecie od najwiekszej wartosci
i=arr(1);                                                                               %1
j=arr(2);                                                                               %1

align1="";                                                                              %1
align2="";                                                                              %1

%dopasowanie zatrzymuje siê w momencie natrafienia na wartoœæ 0
while (V(i,j)>0)                                                                        % <m x n => <n^2
    if (i > 1 && j > 1)                                                                 %1
        Vcurrent=V(i,j);                                                                %1
        Vdiagonal = V(i-1,j-1);                                                         %1
        Vup = V(i,j-1);                                                                 %1
          
        if Vcurrent == Vdiagonal + score_L3(sequence1(j), sequence2(i),scoring)         %1
            align1 = sequence1(j) + align1                                              %1
            align2 =sequence2(i) +align2                                                %1
            i = i- 1                                                                    %1
            j = j- 1                                                                    %1
            
        elseif Vcurrent == Vup + gap                                                    %1
            align1 =sequence1(j) + align1                                               %1
            align2 = '-' + align2                                                       %1
            j = j - 1                                                                   %1
            
        else                                                                            %1
            align1 = '-' + align1                                                       %1
            align2 = sequence2(i) + align2                                              %1
            i = i-1                                                                     %1
        end
    end
end
end

% n^2 + 5 
