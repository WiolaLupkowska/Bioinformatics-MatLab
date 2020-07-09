function list = findMax_L3(A)
%Funkcja znajdujaca indeksy wszystkich maksimow w macierzy i umieszczajaca
%je w liscie

maximum = max(max(A)); %szukam maksymalnej wartoœci
occurences = sum(A(:) == maximum); %iloœæ powtórzeñ max wartoœci
[x,y]=find(A==maximum);
list=[];

 for i=1:occurences
     pair={[x(i,1),y(i,1)]};
     list=[list, pair];
 end
   

end

