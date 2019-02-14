%% create input data
clc;
clear all;
close all;
p = linspace(0,pi,10);
t = sin(p).*sin(5*p);
plot(p,t,'o');

%% create network
for i = 1:20
    net = newfit(p,t,[i],{'tansig' 'purelin'}, 'traingd','','mse',{},{},'');
    [trained_net, stats] = train(net, p, t);
    pause(10.0)
end
% i = 6 is the best

%% Plot 4
num_hidden = [3,6,10,20];
ep = [200, 500, 600, 500];
result = cell(4,10);
perform = cell(4,10);

n_experiments = 10
for i = 1:4
    net = newfit(p,t,[num_hidden(i)],{'tansig' 'purelin'}, 'traingd','','mse',{},{},'');
    net.trainParam.epochs = ep(i);
    for j = 1:n_experiments
        net = init(net);
        [trained_net, stats] = train(net, p, t);
        result{i,j} = trained_net;
        perform{i,j} = stats;
    end
end
%% plot
for i = 1:4
    figure
    ax = axes;
    hold on 
    for j = 1:n_experiments
        net = result{i,j};
        out = net(p);
        tr =  perform{i,j};
        trOut = out(tr.trainInd);
        trTarg = t(tr.trainInd);
        plotregression(trTarg, trOut, 'Train');
%          plotfit(result{i,j},p,t);
%         plot(ax,perform{i,j},'LineWidth',1), title(ax,['number of hidden nodes = ',num2str(num_hidden(i))]);
    end
end


