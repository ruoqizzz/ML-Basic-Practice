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
num_hidden = [3,6,10,20]
result = cell(4,10);
for i = 1:4
    net = newfit(p,t,[num_hidden(i)],{'tansig' 'purelin'}, 'traingd','','mse',{},{},'');
    for j = 1:10
        [trained_net, stats] = train(net, p, t);
        result{i,j} = trained_net;
    end
end
