%% Load the data
load('housing.mat');
norm_house_inputs = mapminmax(houseInputs);

%% build net
net = newff(norm_house_inputs, houseTargets, [20], {'tansig', 'purelin'}, 'trainrp', '', ...
            'mse', {},{}, 'dividerand');
net.trainParam.max_fail = 1000;
net.trainParam.epochs = 5000;
net.trainParam.min_grad = 0;

%% train
n_experiments = 20;
for i = 1:n_experiments
    net = init(net);
    [trained_net, stats] = train(net, norm_house_inputs, houseTargets);
    figure, plotperform(stats);
end
%% plot the result
