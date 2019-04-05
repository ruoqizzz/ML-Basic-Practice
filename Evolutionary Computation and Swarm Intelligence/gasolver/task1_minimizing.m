%% Visiualization
clear all;
load lab4.mat;
ack = GAparams;
ack.visual.type = 'mesh'; 
% ga_visual_ackley([],[],[],[],[],[],ack.visual,[],[]);
% ack.visual.bounds = [-2, 2]; 
% ack.visual.interval = 0.05; 
% ga_visual_ackley([],[],[],[],[],[],ack.visual,[],[]);

fit_all = zeros(10,1); 
for i = 1:size(fit_all,1)
    ack.stop.direction = 'min'; 
    ack.visual.func = 'ackley'; 
%     ack.visual.active = true; 
    ack.verbose = false;
    ack.crossover.func = 'uniform';
    ack.mutate.decay = 'exponential';
%     ack.mutate.proportional = true;
    
    ack.replace.comparative = true;
    [best, fit, stat] = GAsolver(100, [-32, 32], 'ackley', 200, 1000, ack);
    fit_all(i) = fit;
end
mean_all = mean(fit_all)