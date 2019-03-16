clear all;
load unknown_data;

%%
normData = mapminmax(unknown_data);
som = newsom(normData, [15 15], 'hextop', 'linkdist', 200, 5);
som.trainParam.epochs = 200*11;
[som_win, stats] = train(som, normData);