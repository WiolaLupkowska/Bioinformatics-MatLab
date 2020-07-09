function [] = analyze_L3(loadingMode,seq1, seq2, graficzne, myFasta, scoreLoad, gap)

%Funkcja analizuj¹ca dwie sekwencje pod k¹tem dopasowania lokalnego
%
%loading mode       - keyboard/fasta/ncbi
%seq1,seq2          - sekwencje wpisane z klawiatury/nazwy plików fasta/id sekwencji w bazie ncbi w zale¿noœci od wybranego trybu wczytywania
%scoring            - schematu punktowania zgodnoœci i niezgodnoœci przy
%pomocy macierzy 4x4 (rêcznie/ z pliku)
%gap                - kara za przerwê
%graficzne          - 1 v 0 (1 powoduje wyswietlenie sciezki dopasowania i jej zapis do pliku)
%myFasta            - 1 v 0 (1 powoduje wyswietlenie tablicy i jej zapis do pliku)
%

switch loadingMode                                                        %1
    case 'ncbi'                                                           %1
        id1=seq1;                                                         %1
        fastaContent1 = fetchFasta(id1);                                  %5+1
        parsedFasta1 = parseFasta(fastaContent1);                         %3+n(4+2)=3+5n
        sequence1 = extractfield(parsedFasta1,'Sequence');                %1
        
        id2=seq2;                                                         %1
        fastaContent2 = fetchFasta(id2);                                  %5+1
        parsedFasta2 = parseFasta(fastaContent2);                         %3+n(4+2)=3+5n
        sequence2 = extractfield(parsedFasta2,'Sequence');                %1
        
    case 'fasta'                                                          %1
        filename1=seq1;                                                   %1
        fastaContent1 = loadData(filename1);                              %2
        parsedFasta1 = parseFasta(fastaContent1);                         %3+n(4+2)=3+5n
        sequence1 = extractfield(parsedFasta1,'Sequence');                %1
        
        filename2=seq2;                                                   %1
        fastaContent2 = loadData(filename2);                              %2
        parsedFasta2 = parseFasta(fastaContent2);                         %3+n(4+2)=3+5n
        sequence2 = extractfield(parsedFasta2,'Sequence');                %1
        
    case 'keyboard'                                                       %1
        fastaContent1 = insertSequence(seq1);                             %5
        sequence1 = extractfield(fastaContent1,'Sequence');               %1
        fastaContent2 = insertSequence(seq2);                             %5
        sequence2 = extractfield(fastaContent2,'Sequence');
end

if ischar(scoreLoad)==1                                                   %jeœli zmienna jest typu string -> wpisano nazwê pliku, w przeciwnym wypadku jest to tablica
    scoring=loadScheme_L3(scoreLoad);                                     %2
else
    scoring=scoreLoad;                                                    %1
end
    

if graficzne == 1                                                         %1
    sequence1 = char(sequence1(1));                                       %1                                     
    sequence2 = char(sequence2(1));                                       %1

    V = makeMatrix_L3(sequence1,sequence2, scoring, gap);               %8+2n+n^2
    figure;                                                             %1
    fig = imagesc(V);                                                   %1
    xlabel(seq1);                                                       %1
    ylabel(seq2);                                                       %1
    saveas(fig,'graph.png')                                             %1
end

if myFasta==1                                                           %1
    sequence1 = char(sequence1);                                        %1
    sequence2 = char(sequence2);                                        %1
    V = makeMatrix_L3(sequence1,sequence2, scoring, gap);               % 8+2n+n^2
    maximum = max(max(V)); %szukam maksymalnej wartoœci                 %1
    occurences = sum(V(:) == maximum);                                  %1
    list=findMax_L3(V);   %lista indeksów liczb w matrixie, które s¹ maximami   %7
    str1='path';                                                                %1
    for i=1:occurences  %dla ka¿dego ewentualnego maximum tworzê osobn¹ œcie¿kê % liczba zale¿na od wartoœci zmiennej occurences
        str2=num2str(i);                                                        %1
        filename=strcat(str1,str2);                                             %1
    [aln1,aln2]=path_L3(V,sequence1,sequence2,list(i),scoring,gap);             % n^2+5
    myFasta_L3(aln1,aln2,filename);                                             %9
    end                                                                         %2
end

end

