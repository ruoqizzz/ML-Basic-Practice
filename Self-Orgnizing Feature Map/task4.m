clear all;
load iris_dataset;

%%
normIrisInputs = mapminmax(irisInputs);
som = newsom(normIrisInputs, [10 10], 'hextop', 'linkdist', 100, 5);
som.trainParam.epochs = 100*10+100;
[som_win, stats] = train(som, normIrisInputs);

%%
figure(1)
plotsomhits(som_win, normIrisInputs(:,1:50)),title("iris1");
figure(2)
plotsomhits(som_win, normIrisInputs(:,51:100)),title("iris2");
figure(3)
plotsomhits(som_win, normIrisInputs(:,101:150)),title("iris3");