function result = score_L3(letter1,letter2, scoring)
%Funkcja wyci¹gaj¹ca punktacjê dopasowania zasad na podstawie podanej przez
%u¿ytkownika macierzy punktacji

result=0;
colNames = {'A','C','G','T'};
rowNames = {'A','C','G','T'};

   for i=1:4
       scoringLetter1 = char(colNames(i));
        for j=1:4
            scoringLetter2 = char(rowNames(j));
             if (scoringLetter1==letter1 & scoringLetter2==letter2)
                 result=scoring(i,j) ;
             end  
        end
   end          
end


