function V = makeMatrix_L2(sequence1,sequence2, match, mismatch, gap)

m=length(sequence1);
n=length(sequence2);

V=[];
V = zeros([n,m]);
i = n;
j = m;

% wype³niam brzegi, zawsze s¹ tak samo
   for i=1:n
      V(i,1) = -1 * i+1;   
   end
   
   for j=1:m
      V(1,j) = -1 * j+1;
   end 
   
   for i=2:n
        for j=2:m        
           sub = V(i - 1,j - 1) + score(sequence1(j-1), sequence2(i-1), match, mismatch);
           del = V(i - 1,j) + gap;     
           insert = V(i,j - 1) + gap;
           V(i,j) = max([sub, del, insert]);          
        end
   end

end

