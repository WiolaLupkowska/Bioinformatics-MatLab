function [align1,align2] = path_L2(V,sequence1,sequence2,match,mismatch,gap)

m=length(sequence1);
n=length(sequence2);
j = m;
i = n;


align1="";
align2="";

    while (i > 1 && j > 1)
        Vcurrent=V(i,j);
        Vdiagonal = V(i-1,j-1);
        Vup = V(i,j-1);

        
       
        if Vcurrent == Vdiagonal + score(sequence1(j), sequence2(i),match,mismatch)
            align1 = sequence1(j) + align1
            align2 =sequence2(i) +align2
            i = i- 1
            j = j- 1
            
        elseif Vcurrent == Vup + gap
            align1 =sequence1(j) + align1 
            align2 = '-' + align2
            j = j - 1
            
        else
            align1 = '-' + align1
            align2 = sequence2(i) + align2
            i = i-1
            
        end
    end
    
    %dokoñczenie
    if( i>1 || j>1)
         while (j > 1)
        align1 = sequence1(j) + align1
        align2 =  '-' + align2
        j = j-1
    while (i > 1)
        align1 = '-' + align1
        align2 = sequence2(i) + align2
        i = i - 1
        
    end 
         end
    end
    

end

