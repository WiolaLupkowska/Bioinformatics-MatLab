function [match,mismatch,gap] = amounts_L2(aln1,aln2)

match = 0;
mismatch = 0;
gap = 0;
aln1=char(aln1);
aln2=char(aln2);
   
for i=1:length(aln1)
  
    if aln1(i)==aln2(i)
        match=match+1
      
    elseif aln1(i)=='-' || aln2(i)=='-'
        gap = gap+1
  
    else
        mismatch = mismatch+1
        
    end
end
end

