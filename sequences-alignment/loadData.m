function fastaContent = loadData(filename)
% Funkcja pobieraj¹ca dane z pliku w formacie FASTA do 1 komórki
% filename - nazwa pliku 
% fastaContent - dane pobrane z pliku
% header - nag³ówek
% sequence - sekwencja

fastaContent = fileread(filename);
end

