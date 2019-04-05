%%
clear all;
load lab4.mat;
star = GAparams
star.objParams.star = star1;
[best, fit, stat] = GAsolver(2, [0 20 ; 0 20], 'circle', 50, 100, star);

%% Q6
press = [2, 1.75, 1.5, 1.25,1];
best_all = zeros(size(press,2),2);
fit_all = zeros(size(press,2),1); 
figure(1)
for i = 1:size(press,2)
    star = GAparams;
    star.objParams.star = star1;
    star.select.func = 'rank';
    star.select.pressure = press(i);
    star.verbose = false;
    [best, fit, stat] = GAsolver(2, [0 20 ; 0 20], 'circle', 50, 100, star);
    best_all(i,:) = best;
    fit_all(i) = fit;
    subplot(2,3,i),ga_plot_diversity(stat,press(i));
end

%% Q8 star 2
star = GAparams;
star.objParams.star = star2;
star.visual.active = 1; 
star.visual.func = 'circle';
star.select.func = 'rank';
star.select.pressure = 1.25;
% star.verbose = false;
[best, fit, stat] = GAsolver(2, [0 20 ; 0 20], 'circle', 200, 200, star);
figure(2)
ga_plot_diversity(stat,press(i));

%% Q8 star 3
star = GAparams;
star.objParams.star = star3;
star.visual.active = 1; 
star.visual.func = 'circle';
star.select.func = 'rank';
star.select.pressure = 1.25;
% star.verbose = false;
[best, fit, stat] = GAsolver(2, [0 20 ; 0 20], 'circle', 100, 200, star);
figure(2)
ga_plot_diversity(stat,press(i));
