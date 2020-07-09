function [fastaContent] = insertSequences()
% Funkcja umo¿liwiaj¹ca rêczne wpisanie z klawiatury sekwencji DNA
%
% prompt- ¿¹danie (pytanie o sekwencjê)
% input- sekwencja wpisana z klawiatury

fastaContent = insertSequence(); %pierwsza sekwencja
odp= 'tak';

while (odp == 'tak')
    prompt= 'Czy chcesz wprowadziæ kolejn¹ sekwencjê? (tak/nie) ';
    odp =input(prompt);

    if odp == 'tak'
        prompt= 'Podaj nazwê ';
        h=input(prompt);
        prompt= 'Podaj sekwencjê ';
        s =input(prompt);
        fastaContent(end+1) = struct('Header', {h}, 'Sequence', {s}); 
    else
        break;
    end

end



end

