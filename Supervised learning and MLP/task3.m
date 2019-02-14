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


%% training data and test data
training_input = input(1:13, 1:140);
training_target = target(1:3,1:140);

test_input = input(1:13,141:178);
test_target = target(1:3,141:178);



%% try to find best MLP: number of hidden node
n_experiments = 20;                % How many experiments to run?
nodes_num = [2 3 4 5 6 7 8 9 10 20 50];
% perf = zeros(size(nodes_num,2),1);
for i = 1:size(nodes_num,2)
    fprintf('Hidden nodes: %d\n', nodes_num(i));
    
    net = newff(training_input, training_target, [nodes_num(i)], {'purelin' 'purelin'}, 'trainrp', '', 'mse', {}, {}, '');
    net.trainParam.lr = 0.01;
    net.trainParam.epochs = 1500;
    acc = 0;
    for j = 1:n_experiments
        net = init(net);
        [trained_net, stats] = train(net, training_input, training_target);
        [c,cm] = confusion(test_target, sim(trained_net, test_input));
%         fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c));
%         fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);
        acc = acc +(1-c);
    end
    acc = acc / n_experiments;
    fprintf('Percentage Correct Classification   : %f%%\n', 100*acc);
%     fprintf('Percentage Incorrect Classification : %f%%\n', 100*(1-acc);
end




%% try to find best MLP: epochs
ep = [1000, 1100 ,1200, 1300, 1400,1500]
for i = 1:size(ep,2)
    fprintf('Epoches: %d\n', ep(i));
    net = newff(training_input, training_target, [10], {'purelin' 'purelin'}, 'trainrp', '', 'mse', {}, {}, '');
    net.trainParam.lr = 0.01;
    net.trainParam.epochs = ep(i);
    acc = 0;
    for j = 1:n_experiments
        net = init(net);
        [trained_net, stats] = train(net, training_input, training_target);
        [c,cm] = confusion(test_target, sim(trained_net, test_input));
%         fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c));
%         fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);
        acc = acc +(1-c);
    end
    acc = acc / n_experiments;
    fprintf('Percentage Correct Classification   : %f%%\n', 100*acc);
%     fprintf('Percentage Incorrect Classification : %f%%\n', 100*(1-acc);
end

%% Normalize
n_experiments = 20;
norm_input = mapminmax(input);
norm_training_input = norm_input(1:13, 1:140);
norm_test_input = norm_input(1:13,141:178);

net = newff(norm_training_input, training_target, [10], {'purelin' 'purelin'}, 'trainrp', '', 'mse', {}, {}, '');
net.trainParam.lr = 0.01;
net.trainParam.epochs = 1500;
  acc = 0;
for j = 1:n_experiments
    net = init(net);
    [trained_net, stats] = train(net, norm_training_input, training_target);
    [c,cm] = confusion(test_target, sim(trained_net, norm_test_input));
    acc = acc +(1-c);
end
acc = acc / n_experiments;
fprintf('Percentage Correct Classification after Normalizarion  : %f%%\n', 100*acc);

%% Pruning the number of hidden nodes afer NORMALIZATION
n_experiments = 10;                % How many experiments to run?
nodes_num = [1 2 3 4 5 6 7 8 9];
% perf = zeros(size(nodes_num,2),1);
for i = 1:size(nodes_num,2)
    fprintf('Hidden nodes: %d\n', nodes_num(i));
    net = newff(norm_training_input, target, [nodes_num(i)], {'purelin' 'purelin'}, 'trainrp', '', 'mse', {}, {}, '');
    acc = 0;
    for j = 1:n_experiments
        net = init(net);
        [trained_net, stats] = train(net, norm_training_input, training_target);
        [c,cm] = confusion(test_target, sim(trained_net, norm_test_input));
%         fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c));
%         fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);
        acc = acc +(1-c);
    end
    acc = acc / n_experiments;
    fprintf('Percentage Correct Classification   : %f%%\n', 100*acc);
%     fprintf('Percentage Incorrect Classification : %f%%\n', 100*(1-acc);
end

