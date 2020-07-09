function scoring = scoringScheme_L3(input1, input2)
%Funkcja pozwalająca na określenie schematu punktowania zgodności 
%i niezgodności przy pomocy macierzy substytucji i punktacji przerwy 
%podanych przez użytkownika

scoreMatrix = input1;
gap = input2;
scoring = {scoreMatrix, gap};

end
