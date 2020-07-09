function [] = analyze(loadingMode,seq1, seq2, seqMatch,seqMismatch,seqGap,path,table)

%Funkcja analizuj¹ca dwie sekwencje
%
%loading mode       - keyboard/fasta/ncbi
%seq1,seq2          - sekwencje wpisane z klawiatury/nazwy plików fasta/id sekwencji w bazie ncbi w zale¿noœci od wybranego trybu wczytywania
%shcemat punktacji  - match/mismatch/gap
%path               - 1 v 0 (1 powoduje wyswietlenie sciezki dopasowania i jej zapis do pliku)
%table              - 1 v 0 (1 powoduje wyswietlenie tablicy i jej zapis do pliku)
%

switch loadingMode                                                      %1
   case 'ncbi'                                                            %1
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
      fastaContent1 = insertSequence(seq1);                                             %5
      sequence1 = extractfield(fastaContent1,'Sequence');               %1
      fastaContent2 = insertSequence(seq2);                                              %5
      sequence2 = extractfield(fastaContent2,'Sequence');
end
      
      if path==1
       sequence1 = char(sequence1(1));
       sequence2 = char(sequence2(1));
       %zrób matrix
        V = makeMatrix_L2(sequence1,sequence2,seqMatch,seqMismatch,seqGap);                  %7+n+m+n*(m+4)
        %zrób œcie¿kê
        [aln1,aln2]=path_L2(V,sequence1,sequence2,seqMatch,seqMismatch,seqGap);                     % 7+m*16
        %ile match mismatch gap
        [match, mismatch,gap]=amounts_L2(aln1,aln2);                    % 5+m*6
        %statystyki
        stats_L2(aln1,aln2,match,mismatch,gap,sequence1,sequence2);     % 21+4*m
      end
      
      if table==1
       sequence1 = char(sequence1);
       sequence2 = char(sequence2);
       V = makeMatrix_L2(sequence1,sequence2,seqMatch,seqMismatch,seqGap);                  %7+n+m+n*(m+4)
       [aln1,aln2]=path_L2(V,sequence1,sequence2,seqMatch,seqMismatch,seqGap);                     % 7+m*16
       createSaveTable_L2(V);                                          %2
      end

end

