function [fastaContent] = insertSequence()
% Funkcja umo¿liwiaj¹ca rêczne wpisanie z klawiatury sekwencji DNA
% prompt- ¿¹danie (pytanie o sekwencjê)
% h - nazwa wpisana z klawiatury
% s- sekwencja wpisana z klawiatury
% header - macierz zwieraj¹ca nazwê
% sequence - macierz zaiweraj¹ca sekwencjê

prompt= 'Podaj nazwê ';
h=input(prompt);

prompt= 'Podaj sekwencjê ';
s =input(prompt);

fastaContent = struct('Header', {h}, 'Sequence', {s});

%5
end