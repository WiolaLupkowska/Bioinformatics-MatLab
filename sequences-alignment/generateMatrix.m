function R = generateMatrix(sequence1,sequence2)
% Funckja generuj�ca macierz kropkow� dla wpisanych sekwencji
%
% n,m - d�ugo�ci sekwencji

n = strlength(sequence1);
m = strlength(sequence2);


for i = 1:n
   for j = 1:m
       if sequence1(i) == sequence2(j)
            R(j,i) = 1;
       else
            R(j,i) = 0;
        end

    end
    
end

end
%m*n+2
