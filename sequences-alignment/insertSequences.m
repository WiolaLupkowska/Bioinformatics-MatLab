function [fastaContent] = insertSequences()
% Funkcja umo�liwiaj�ca r�czne wpisanie z klawiatury sekwencji DNA
%
% prompt- ��danie (pytanie o sekwencj�)
% input- sekwencja wpisana z klawiatury

fastaContent = insertSequence(); %pierwsza sekwencja
odp= 'tak';

while (odp == 'tak')
    prompt= 'Czy chcesz wprowadzi� kolejn� sekwencj�? (tak/nie) ';
    odp =input(prompt);

    if odp == 'tak'
        prompt= 'Podaj nazw� ';
        h=input(prompt);
        prompt= 'Podaj sekwencj� ';
        s =input(prompt);
        fastaContent(end+1) = struct('Header', {h}, 'Sequence', {s}); 
    else
        break;
    end

end



end

