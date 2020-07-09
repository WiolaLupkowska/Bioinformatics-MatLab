function fastaContent = loadData(filename)
% Funkcja pobieraj�ca dane z pliku w formacie FASTA do 1 kom�rki
% filename - nazwa pliku 
% fastaContent - dane pobrane z pliku
% header - nag��wek
% sequence - sekwencja

fastaContent = fileread(filename);
end

