function fig = dotplot(filteredMatrix, s1,s2, nazwaS1,nazwaS2)
%Funkcja tworz¹ca graficzne odwzorowanie macierzy z opisem osi,
%legend¹, tytu³em

dimensions = size(filteredMatrix);
x=[];
y=[];
                                                %3

for i = 1:dimensions(2)
   for j = 1:dimensions(1)
       if filteredMatrix(j,i)==1
           x = [x j];
           y = [y i];
       end
   end
end
                                                %m*(n+3)
xletters = cellstr(s1')';  %moje labele osi
yletters = cellstr(s2')';
  
figure                                          %3
 for i=1:length(x)                              %x -ilosc jedynek <= m*n*8     
   plt = plot(y(i), x(i), '*');
   grid on;
   set(gca, 'ydir', 'reverse', 'xaxislocation', 'top') %dajê oœ x na gorze, y daje odwrotnie
   set(gca,'xtick',[1:length(x)],'xticklabel',xletters);
   set(gca,'ytick',[1:length(y)],'yticklabel',yletters);
   title('DOT PLOT');
   legend(nazwaS1, nazwaS2);
   hold on
  

 end
fig  = ancestor(plt, 'figure');

end
%3+m*(n+3)+3+m*n*8
