function FastaSet = parseFasta(fastaContent)
% Frukcja parsuj¹ca plik fasta do struktury
%   Detailed explanation goes here

FastaSet = struct('Header',{},'Sequence',{});
n = 0;
remain = char(fastaContent);
%3
while ~isempty(remain) %nx1
    [token, remain] = strtok( remain, newline);
    if ~isempty(remain) && token(1) == '>' %1x3+1 (spr warunku)
        n = n + 1;
        FastaSet(n).Header = token(2:end);
        FastaSet(n).Sequence = ' ';
    elseif n>0 %1x1
        FastaSet(n).Sequence = strcat(FastaSet(n).Sequence, token); %1
    end
end

end

%3+n(4+2)=3+5n