function [] = stats_L2(aln1,aln2,match,mismatch,gap,sequence1,sequence2)

aln1=char(aln1);
aln2=char(aln2);
identity = match/length(aln1);
gaps = gap/length(aln1);
percentageGaps = gaps/length(aln1);

lines ="";

for i=1:length(aln1)
 if aln1(i)==aln2(i)
        lines = lines+"|";

    else
        lines = lines+" ";
        
 end
end




str1 = strcat("1: ",sequence1);
str2 = strcat("2: ",sequence2);
str3 = strcat("Match: ",int2str(match));
str4 = strcat("Mismatch: ",int2str(mismatch)) ;
str5 = strcat("Gap: ",int2str(gap));
str6 = strcat("Length: ",int2str(length(aln1)));
str7 = strcat("Identity: ",int2str(match),'/', int2str(length(aln1))," " ,num2str(identity*100),'%');
str8 = strcat("Gaps: ",int2str(gap),"/",int2str(length(aln1))," ",num2str(gaps*100),'%');
str9 = aln1;
str10 = lines;
str11 = aln2;

fid = fopen('result.txt','wt');
%str = strcat(str1,'/n',str2,'/n',str3,'/n',str4,'/n',str5,'/n',str6,'/n',str7,'/n',str8,'/n',str9,'/n',str10,'/n',str11);
fprintf(fid, '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s', str1,str2,str3,str4,str5,str6,str7,str8,str9,str10,str11);
fclose(fid);
end

