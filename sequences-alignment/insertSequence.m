function [fastaContent] = insertSequence()
% Funkcja umo�liwiaj�ca r�czne wpisanie z klawiatury sekwencji DNA
% prompt- ��danie (pytanie o sekwencj�)
% h - nazwa wpisana z klawiatury
% s- sekwencja wpisana z klawiatury
% header - macierz zwieraj�ca nazw�
% sequence - macierz zaiweraj�ca sekwencj�

prompt= 'Podaj nazw� ';
h=input(prompt);

prompt= 'Podaj sekwencj� ';
s =input(prompt);

fastaContent = struct('Header', {h}, 'Sequence', {s});

%5
end