function [ ] = ga_plot_diversity( stats ,i)
%GA_PLOT_diversity Fitness values over generations


plot([0:stats.generations],stats.diversity);
hold on
title(['Population Diversity, pressure ',num2str(i)]);
xlabel('Generation');
ylabel('Diversity');
xlim([0 stats.generations]);
drawnow