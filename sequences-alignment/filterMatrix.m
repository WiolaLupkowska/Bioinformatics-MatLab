function filteredMatrix = filterMatrix(R,K,S)
%Funkcja filtruje macierz dla zadanych wielkoœci okna(K) i progu b³êdu (S)
%n,m wymiary macierzy niefiltrowanej

tempMatrix = zeros([K,K]);
siz = size(R);
m=siz(1);
n=siz(2);
filteredMatrix = zeros([m n]);

for i = 1:m-K+1
   for j = 1:n-K+1
    A = R(i:i+(K-1), j:j+(K-1));  %submatrix
    przekatna=diag(A);              % przek¹tna ssubmatrixa
        if (sum(przekatna(:)) == K-S)  %jeœli suma jedynek w przekatnej sie zgadza
            tempMatrix(1:K+1:end)=przekatna;   %tymczasowa matrix jest samymi zerami, kopiuje przekatna z A do tymczasowej zeby usunac jedynki poza przek¹tn¹
            filteredMatrix(i:i+(K-1), j:j+(K-1)) = tempMatrix; %minus 1 zeby doslo do brzegow macierzy
        elseif (sum(przekatna(:)) == K)
               tempMatrix(1:K+1:end)=przekatna;
            filteredMatrix(i:i+(K-1), j:j+(K-1)) = tempMatrix;
        end

        
    end
end  
end

%5+(m-K+1)((n-K+1)+2+6)