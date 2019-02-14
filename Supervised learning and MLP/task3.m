%% load data
clc;
clear all;
close all;
[input, target] =wine_dataset;
input_size = size(input);
target_size = size(target);
setdemorandstream(444000444);
% 13 Features:
% Alcohol Malic acid As  Alkalinity of ash
% Magnesium Total phenols Flavanoids Nonflavanoid phenols
% Proanthocyanidins Color intensity Hue OD280/OD315 of diluted wines Proline

%% try to find best MLP: number of hidden node
n_experiments = 10;                % How many experiments to run?
nodes_num = [2 3 5 8 10 15 20 30 40 50];
% perf = zeros(size(nodes_num,2),1);
for i = 1:size(nodes_num,2)
    nodes_num(i)
    net = newff(input, target, [nodes_num(i)], {'purelin' 'purelin'}, 'trainrp', '', 'mse', {}, {}, '');
    net.trainParam.lr = 0.01;
    net.trainParam.epochs = 1500;
    for j = 1:n_experiments
        net = init(net);
        [trained_net, stats] = train(net, input, target);
        result = sim(trained_net, )
    end
    
end




%% try to find best MLP: epochs
ep = [1000, 1100 ,1200, 1300, 1400,1500]
for i = 1:size(ep,2)
    net = newff(input, target, [5], {'purelin' 'purelin'}, 'trainrp', '', 'mse', {}, {}, '');
    net = init(net);
    net.trainParam.lr = 0.01;
    net.trainParam.epochs = ep(i);
    [trained_net, stats] = train(net, input, target);
    figure, plotconfusion(target, sim(trained_net, input)), title(['epoches ',num2str(ep(i))]);
end

