function V = makeMatrix_L3(sequence1,sequence2, scoring, gap)
%Funkcja tworz¹ca macierz punktacji na podstawie schematu punktacji
%podanego przez u¿ytkownika

m=length(sequence1);    %1
n=length(sequence2);%1

V=[];%1
V = zeros([n,m]);%1
i = n;%1
j = m;%1

% wype³nienie brzegów
   for i=1:n  %n
      V(i,1) = 0; %1   
   end
   
   for j=1:m %m
      V(1,j) = 0; %1
   end 
   
   for i=2:n %m x n
        for j=2:m        
           sub = V(i - 1,j - 1) + score_L3(sequence1(j-1), sequence2(i-1), scoring);
           del = V(i - 1,j) + gap;     
           insert = V(i,j - 1) + gap;
           V(i,j) = max([sub, del, insert, 0]);          
        end
   end

end

% 8+2n+n^2
