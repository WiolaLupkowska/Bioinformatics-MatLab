function [] = savePlot(fig)
% Zapis dotplotu pod podana nazwa

prompt= 'Jak nazwaæ plik?';
filename=input(prompt);
saveas(fig,filename)
end

