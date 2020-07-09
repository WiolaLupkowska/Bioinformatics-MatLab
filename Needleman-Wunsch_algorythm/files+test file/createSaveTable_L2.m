function [] = createSaveTable_L2(V)

T = array2table(V);
writetable(T,'table');

end

