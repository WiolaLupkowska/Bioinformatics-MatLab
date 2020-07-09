function scoring = scoringScheme_L3(input1, input2)
%Funkcja pozwalaj¹ca na okreœlenie schematu punktowania zgodnoœci 
%i niezgodnoœci przy pomocy macierzy substytucji i punktacji przerwy 
%podanych przez u¿ytkownika

scoreMatrix = input1;
gap = input2;
scoring = {scoreMatrix, gap};

end
