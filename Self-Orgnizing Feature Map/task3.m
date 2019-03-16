clear all;
load wine_dataset;

%% train for 5*5
som = newsom(wineInputs, [10 10], 'hextop', 'linkdist', 1000, 5);
som.trainParam.epochs = 1000*10+1000;
[som_win, stats] = train(som, wineInputs);
%%
figure(1)
plotsomhits(som_win, wineInputs(:,1:59)),title("wine1");
figure(2)
plotsomhits(som_win, wineInputs(:,60:130)),title("wine2");
figure(3)
plotsomhits(som_win, wineInputs(:,131:178)),title("wine3");


%% Normalized
normWineInputs = mapminmax(wineInputs);
som = newsom(normWineInputs, [10 10], 'hextop', 'linkdist', 1000, 5);
som.trainParam.epochs = 1000*10+1000;
[som_win, stats] = train(som, normWineInputs);

%%
figure(1)
plotsomhits(som_win, normWineInputs(:,1:59)),title("wine1");
figure(2)
plotsomhits(som_win, normWineInputs(:,60:130)),title("wine2");
figure(3)
plotsomhits(som_win, normWineInputs(:,131:178)),title("wine3");
