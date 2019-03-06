%% Create data and network
clc;
close all;
clear all;

p = [[0;0] [0;1] [1;0] [1;1]];
t = [0 1 1 0];


%% Train the network with gradient
% net = newff(P,T,S,TF,BTF,BLF,PF,IPF,OPF,DDF)
net = newff(p, t, [2], {'tansig' 'logsig'}, 'traingd', '', 'mse', {}, {}, '');
net = init(net);
% stats: training record
[trained_net, stats] = train(net, p, t);
plot_xor(trained_net);


%% 10 training sessions
lr = [0.1 2 20]
ep = [1000 100 30]
n_experiments = 10;
result = cell(3,n_experiments);
for i = 1:3
    net = newff(p, t, [2], {'tansig' 'logsig'}, 'traingd', ...
                '', 'mse', {}, {}, '');
    net.trainParam.lr = lr(i);
    net.trainParam.epochs = ep(i);
    for j = 1:n_experiments
        net = init(net);
        [trained_net, stats] = train(net, p, t);
        result{i,j} = stats.perf;
    end
end

%% plot
for i = 1:3
    figure
    ax = axes;
    hold on
    for j = 1:n_experiments
        plot(ax,result{i,j},'LineWidth',1), title(ax,['lr = ',num2str(lr(i))]);
    end
end

%% Experiment with different learning rate
lr = [0.01 0.1 1.0 10.0 20.0];
ep = [6000 500 50 3 1]
trained_nets = cell(4,1);
for i = 1:5
    net.trainParam.lr = lr(i);
    net.trainParam.epochs = ep(i);
    [trained_net, stats] = train(net, p, t);
    trained_nets{i} = trained_net;
end
%% plot the xor value of nodes including hidden and output nodes
for i = 1:5
    plot_xor(trained_nets{i});
end

%% Train with backpropagation
% trainrp: Rpro
net = newff(p,t,[2],{'tansig','logsig'},'trainrp','','mse',{},{},'');
net = init(net);
net.trainParam.deltamax = 40
% stats: training record
[trained_net, stats] = train(net, p, t);
plot_xor(trained_net);

%% experiment
n_experiments = 10;
result = cell(n_experiments, 1);

net = newff(p,t,[2],{'tansig','logsig'},'trainrp','','mse',{},{},'');
net.trainParam.deltamax = 40
net.trainParam.epochs = 150
for i = 1:n_experiments
    net = init(net);
    [trained_net, stats] = train(net, p, t);
    result{i,1} = stats.perf;
end
%%
figure
ax = axes;
hold on 
for i = 1:n_experiments
    plot(ax,result{i,1},'LineWidth',1), title(ax,'Rprop');
end


