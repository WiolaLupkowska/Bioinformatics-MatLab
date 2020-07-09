%close all
clear all;
clc

% zmienne:
% content         dane wprowadzone z klawiatury
% fastaContent    zawartoœæ pliku FASTA,
% parsedFasta     sparsowany FASTA
%%
identifier = int2str(16252.1);
    URL1 = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=';
    URL2=',24475906&rettype=fasta&retmode=text';
    URL= strcat(URL1,identifier,URL2);
%% pobieranie ze strony /ok
fastaContent = fetchFasta(5);
%% parsowanie pliku ze strony /ok
parsedFasta = parseFasta(fastaContent);
%% pobranie z pliku /ok
%fileContent = loadData('DNAsequence2.fasta');
fileContent1 = loadData('dog.fasta');
fileContent2 = loadData('chicken1.fasta');
%% parsowanie pobranego z pliku z komputera /ok
parsedFile1 = parseFasta(fileContent1);
%% pobranie z klawiatury (od razu parsowane)
keyboardContent = insertSequences();
%% wyci¹ganie samej sekwencji ze struktury
sequenceFile2 = extractfield(parsedFile2,'Sequence');
sequenceFasta = extractfield(parsedFasta,'Sequence');
sequenceKeyboard = extractfield(keyboardContent,'Sequence');
%% przerabiam 1x1 cell na ci¹g charów 'AGDTAGDTTT'
sequence2 = char(sequenceFile2(1));
sequence2 = char(sequenceKeyboard(1));

%%
sequence3 = 'CCAGCGCTCGTCTTGCAAATGTTGGGGTTTCTCTGCCACGTTGCTATCGCAGGACGAACCTGCCCCAAGCCAGATGAGCTACCGTTTTCCACGGTGGTTCCACTGAAACGGACCTATGAGCCCGGGGAGCAGATAGTCTTCTCCTGCCAGCCGGGCTACGTGTCCCGGGGAGGGATCCGGCGGTTTACATGCCCGCTCACAGGACTCTGGCCCATCAACACGCTGAAATGCATGCCCAGAGTATGTCCTTTTGCTGGGATCTTAGAAAACGGAACGGTACGCTATACAACGTTTGAGTATCCCAACACCATCAGCTTTTCTTGCCACACGGGGTTTTATCTGAAAGGAGCTAGTTCTGCAAAATGCACTGAGGAAGGGAAGTGGAGCCCAGACCTTCCTGTCTGTGCCCCTATAACCTGCCCTCCACCACCCATACCCAAGTTTGCAAGTCTCAGCGTTTACAAGCCGTTGGCTGGGAACAACTCCTTCTATGGCAGCAAGGCAGTCTTTAAGTGCTTGCCACACCACGCGATGTTTGGAAATGACACCGTTACCTGCACGGAACATGGGAACTGGACGCAGTTGCCAGAATGCAGGGAAGTAAGATGCCCATTCCCATCAAGACCAGACAATGGGTTTGTGAACCATCCTGCAAATCCAGTGCTCTACTATAAGGACACCGCCACCTTTGGCTGCCATGTAGAAACGTATTCCTTGGATGGACCGGAAGAAGTAGAATGCAGCAAATTCGGAAACTGGTCTGCACAGCCAAGCTGTAAAGCATCTTGTAAGTTATCTATTAAAAGAGCTACTGTGATATATGAAGGAGAGAGAGTAGCTATCCAGAACAAATTTAAGAATGGAATGCTGCATGGCCAAAAGGTTTCTTTCTTCTGCAAGCATAAGGAAAAGAAGTGCAGCTACACAGAAGATGCTCAGTGCATAGACGGCACCATCGAGATTCCCAAATGCTTCAAGGAGCACAGTTCTTTAGCTTTCTGGAAAACGGATGCATCTGACGTAAAACCATGCTAAGCTGGTTTTCACACTGAAAATTAAATGTCATGCTTATATGTGTCTGTCTGAGAATCTGATGGAAACGGAAAAATAAAGAGACTGAATTTACCGTGTCAAGA';
sequence4 = 'AATGTGCTCAGTG';
sequence5 = 'ATGTCAATG';

%% Wygenerowanie macierzy kropkowej
R= generateMatrix(sequence1, sequence2);
size(R)

%% filtruje- znajduje przekatne ktore sie zgadzaja
filteredMatrix = filterMatrix(R,10,3);

%% zle zrozumiane filtrowanie
  if   (przekatna(1:S) == zeros([1,S]) & przekatna(S+1:K)==ones([1,K-S]) ) 
         przekatna
        elseif (przekatna(K-S+1:K) == zeros([1,S]) & przekatna(1:K-S)==ones([1,K-S]) )
         przekatna
         elseif (przekatna(1:K)==ones([1,K]))
           przekatna
  end
    
  %% robiê wykres, gca- get current axis
fig=dotplot(filteredMatrix,sequence1, sequence2,'dog','chicken')

%% zapis do pliku
savePlot(fig)
%%
s1=sequence4;
s2=sequence5;
dimensions = size(filteredMatrix);

x=[];
y=[];
for i = 1:dimensions(2)
   for j = 1:dimensions(1)
       if filteredMatrix(j,i)==1
           x = [x j];
           y = [y i];
       end
   end
end

xletters = cellstr(s1')';  %moje labele osi
yletters = cellstr(s2')';

figure
 for i=1:length(x)       
   fig=plot(y(i), x(i), '*')
   hold on
   set(gca, 'ydir', 'reverse', 'xaxislocation', 'top') %dajê oœ x na gorze, y daje odwrotnie
   set(gca,'xtick',[1:length(x)],'xticklabel',xletters)
   set(gca,'ytick',[1:length(y)],'yticklabel',yletters)
   title('DOT PLOT')
   legend(nazwaS1, nazwaS2)
  

 end
%%
figure
 plot(y(1), x(2), '*')

