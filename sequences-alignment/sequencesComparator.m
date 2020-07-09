
prompt= 'Sk�d pobra� pierwsz� sekwencj�?';   
disp('1- sie�');
disp('2- plik');
disp('3- klawiatura');
action =str2double(input(prompt));
%5


switch action                                                           %1
   case 1                                                               %1
      prompt= 'Podaj id pierwszej struktury';                           %1
      id1=input(prompt);                                                %1
      fastaContent1 = fetchFasta(id1);                                  %5+1
      parsedFasta1 = parseFasta(fastaContent1);                         %3+n(4+2)=3+5n
      sequence1 = extractfield(parsedFasta1,'Sequence');                %1

   case 2                                                               %1
      prompt= 'Podaj nazw� pliku z pierwsz� sekwencj�';                 %1
      filename1=input(prompt);                                          %1
      fastaContent1 = loadData(filename1);                              %2
      parsedFasta1 = parseFasta(fastaContent1);                         %3+n(4+2)=3+5n
      sequence1 = extractfield(parsedFasta1,'Sequence');                %1
      
    case 3                                                              %1
      fastaContent1 = insertSequence();                                 %5
      sequence1 = extractfield(fastaContent1,'Sequence');               %1

    otherwise                                                           %1
       disp('wybrano z�y numer');                                       %1
end 
fprintf(1, '\n');                                                       %1

                                                                        %26+2*(3+5n)+6


prompt= 'Sk�d pobra� drug� sekwencj�?'; 
disp('1- sie�');
disp('2- plik');
disp('3- klawiatura');
action2 =str2double(input(prompt));
fprintf(1, '\n');
                                                                        %6
switch action2                                                          %1
   case 1                                                               %1
      prompt= 'Podaj id drugiej struktury';                             %1
      id2=input(prompt);                                                %1
      fastaContent2 = fetchFasta(id2);                                  %6
      parsedFasta2 = parseFasta(fastaContent2);                         %3+n(4+2)=3+5n
      sequence2 = extractfield(parsedFasta2,'Sequence');                %1
   case 2
      prompt= 'Podaj nazw� pliku z drug� sekwencj�';
      filename2=input(prompt);                                          %3
      fastaContent2 = loadData(filename2);                              %2
      parsedFasta2 = parseFasta(fastaContent2);                         %3+n(4+2)=3+5n
      sequence2 = extractfield(parsedFasta2,'Sequence');                %1
    case 3                                                              %1
      fastaContent2 = insertSequence();                                 %5
      sequence2 = extractfield(fastaContent2,'Sequence');               %1

    otherwise
        disp('wybrano z�y numer');                                      
end
fprintf(1, '\n');                                                       %3

prompt= 'Co chcesz zrobi�?';
disp('1- generowa� macierz kropkow�');
disp('2- generowa� filtrowan� macierz kropkow�');
disp('3- wy�wietli� filtrowan� macierz graficznie');
action3 =str2double(input(prompt));
fprintf(1, '\n');                                                       %6

switch action3
   case 1
       sequence1 = char(sequence1(1));
       sequence2 = char(sequence2(1));                                  %4
      R= generateMatrix(sequence1, sequence2);                          %m*n+2
      R                                                                 %1
   case 2 
       sequence1 = char(sequence1(1));
       sequence2 = char(sequence2(1));                                  %3
      R= generateMatrix(sequence1, sequence2);                          %m*n+2
      prompt= 'podaj d�ugo�� boku okna filtruj�cego';
      K =str2double(input(prompt));
      prompt= 'podaj dopuszczalny b��d';
      S =str2double(input(prompt));                                     %4
      filteredMatrix = filterMatrix(R,K,S);                             %5+(m-K+1)((n-K+1)+2+6)
      filteredMatrix
    case 3
      prompt= 'podaj d�ugo�� boku okna filtruj�cego';
      K =str2double(input(prompt));
      prompt= 'podaj dopuszczalny b��d';
      S =str2double(input(prompt));
      prompt= 'podaj nazw� 1 sekwencji';
      name1 =input(prompt);
      prompt= 'podaj nazw� 2 sekwencji';
      name2 = input(prompt);
       sequence1 = char(sequence1(1)); %sequenceFile1?
       sequence2 = char(sequence2(1));                              %12
      R= generateMatrix(sequence1, sequence2);                          %m*n+2
      filteredMatrix = filterMatrix(R,K,S);                             %5+(m-K+1)((n-K+1)+2+6)
      fig = dotplot(filteredMatrix,sequence1,sequence2,name1,name2);    %3+m*(n+3)+3+m*n*8
      prompt= 'Czy chcesz zapisa� wykres?(tak/nie)';                    %1
      zapis =input(prompt);                                             %1       
      if zapis == 'tak'                                                 %1                                                                   
            savePlot(fig);                                              %3
      end
    otherwise
        disp('wybrano z�y numer');
end
fprintf(1, '\n');                                                       %3





