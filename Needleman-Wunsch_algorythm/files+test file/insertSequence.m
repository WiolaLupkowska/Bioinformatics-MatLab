function [fastaContent] = insertSequence(seq)
% Funkcja umożliwiająca ręczne wpisanie z klawiatury sekwencji DNA do
% struktury

h=seq;
fastaContent = struct('Header', {h}, 'Sequence', {seq});

%2
end