function [] = savePlot(fig)
% Zapis dotplotu pod podana nazwa

prompt= 'Jak nazwa� plik?';
filename=input(prompt);
saveas(fig,filename)
end

