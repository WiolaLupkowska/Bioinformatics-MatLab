function [fastaContent] = insertSequence(seq)
% Funkcja umo�liwiaj�ca r�czne wpisanie z klawiatury sekwencji DNA do
% struktury

h=seq;
fastaContent = struct('Header', {h}, 'Sequence', {seq});

%2
end