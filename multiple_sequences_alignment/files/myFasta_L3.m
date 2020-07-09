function [] = myFasta_L3(aln1,aln2,filename)
%Funkcja tworz¹ca plik, którego format opiera sie na pliku FASTA

aln1=char(aln1);
aln2=char(aln2);

str1 = strcat(">sequence1");
str2 = strcat(aln1);
str3 = strcat(">sequence2");
str4 = strcat(aln2);

fid = fopen(filename,'wt');
fprintf(fid, '%s\n%s\n%s\n%s\n%s', str1,str2,str3,str4);
fclose(fid);

end

%9