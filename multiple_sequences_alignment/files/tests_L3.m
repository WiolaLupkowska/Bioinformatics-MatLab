%% pobranie z pliku, wygenerowanie graficznej reprezentacji macierzy, zapis do pliku w typie fasta
%pary powiazane
analyze_L3('fasta', 'gorillaERV.fasta', 'chimpERV.fasta',1,1,[2 -7 -5 -7; -7 2 -7 -5; -5 -7 2 -7; -7 -5 -7 2],-1); 
%% -||- wczytanie macierzy z pliku
analyze_L3('fasta', 'gorillaERV.fasta', 'chimpERV.fasta', 1,1,'file.txt',-1); 

%% pobranie z pliku, wygenerowanie graficznej reprezentacji macierzy, zapis do pliku w typie fasta
%pary niepowi¹zane
analyze_L3('fasta', 'dog.fasta', 'horse.fasta',1,1,[2 -7 -5 -7; -7 2 -7 -5; -5 -7 2 -7; -7 -5 -7 2],-1);   

%% pobranie sekwencji z klawiatury, wygenerowanie graficznej reprezentacji macierzy, zapis do pliku w typie fasta
analyze_L3('keyboard', 'ADCGADCGAA-----ADCGGA-TDTTTT---TT-T-T-AAAAAAGGG', 'ADC-----GAAACD---A-A-AA-G',1,1,[5 -3 -2 -3; -3 5 -3 -2; -2 -3 5 -3; -3 -2 -3 5],0);

%% pobranie sekwencji z bazy ncbi, wygenerowanie graficznej reprezentacji macierzy
analyze_L3('ncbi', '5', '6',1,0,[2 -7 -5 -7; -7 2 -7 -5; -5 -7 2 -7; -7 -5 -7 2],-1);

%% pobranie sekwencji z bazy ncbi, zapis do pliku w typie fasta
analyze_L3('ncbi', '5', '6',0,1,[2 -7 -5 -7; -7 2 -7 -5; -5 -7 2 -7; -7 -5 -7 2],-1);

%%[2 -7 -5 -7; -7 2 -7 -5; -5 -7 2 -7; -7 -5 -7 2]






