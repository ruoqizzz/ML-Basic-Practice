%% load data
clear all;
load rgb_data;

%% 
% 1000 is for ordering
som = newsom(RGB, [10 10], 'gridtop', 'linkdist', 1000,8); 
% here should be the sum 
som.trainParam.epochs = 1000*10+1000;
[som_rgb, stats] = train(som, RGB);
plot_colors(som_rgb);
