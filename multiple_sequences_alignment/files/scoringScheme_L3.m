function scoring = scoringScheme_L3(input1, input2)
%Funkcja pozwalaj�ca na okre�lenie schematu punktowania zgodno�ci 
%i niezgodno�ci przy pomocy macierzy substytucji i punktacji przerwy 
%podanych przez u�ytkownika

scoreMatrix = input1;
gap = input2;
scoring = {scoreMatrix, gap};

end
