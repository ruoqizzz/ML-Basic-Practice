%% Visiualization
ack = GAparams
% ack.visual.type = 'mesh'; 
% ga_visual_ackley([],[],[],[],[],[],ack.visual,[],[]);
% ack.visual.bounds = [-2, 2]; 
% ack.visual.interval = 0.05; 
% ga_visual_ackley([],[],[],[],[],[],ack.visual,[],[]);

fit_all = zeros(10,1); 
for i = 1:10
    ack.stop.direction = 'min'; 
    ack.visual.func = 'ackley'; 
%     ack.visual.active = true; 
    ack.verbose = false;
    ack.crossover.func = '1point';
%     ack.mutate.decay = 'linear';
    ack.mutate.proportional = true;
    
    ack.replace.comparative = true;
    [best, fit, stat] = GAsolver(100, [-32, 32], 'ackley', 200, 250, ack);
    fit_all(i) = fit;
end
mean(fit_all)