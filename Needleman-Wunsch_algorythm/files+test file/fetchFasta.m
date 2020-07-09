function fastaContent = fetchFasta(identifier)
% funkcja pobieraj¹ca informacje zdalnie (z bazy danych NCBI)
%
% identifier    - id struktury
% URL           = URL1+identifier+URL2
%fastacontent   - zawartoœæ pliku FASTA (ci¹g znaków w 1 komórce)

    identifier = int2str(identifier);
    URL1 = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=';
    URL2=',24475906&rettype=fasta&retmode=text';
    URL= strcat(URL1,identifier,URL2);
    fastaContent = webread(URL);
   
    
end
                                    