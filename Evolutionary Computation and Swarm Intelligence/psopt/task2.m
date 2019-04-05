
options = psooptimset('DemoMode','fast',...
                      'PlotFcns',{@psoplotswarmsurf,@psoplotbestf,@psoplotvelocity},... 
                      'PopInitRange',[-32;32],...
                      'InertiaWeight',1,... 
                      'SocialAttraction',2,...
                      'CognitiveAttraction',2); 


%% Q14
options = psooptimset(options, 'VelocityLimit', 5);
[x, fval] = pso(@ackleysfcn,20,[],[],[],[],[],[],[],options);

%% Q15 without velocity clamping
c1 = 1.49;
c2 = 1.49;
w = 0.7968;
options = psooptimset(options, 'CognitiveAttraction', c1);
options = psooptimset(options, 'SocialAttraction', c2);
options = psooptimset(options, 'InertiaWeight', w);
% [x, fval] = pso(@ackleysfcn,20,[],[],[],[],[],[],[],options);

%% Q16 with velocity clamping
options = psooptimset(options, 'VelocityLimit', 5);
[x, fval] = pso(@ackleysfcn,20,[],[],[],[],[],[],[],options);


%% Q17 inertia weight decay
% A frequently used range is [0.9; 0.4]
options = psooptimset('DemoMode','fast',...
                      'PlotFcns',{@psoplotswarmsurf,@psoplotbestf,@psoplotvelocity},... 
                      'PopInitRange',[-32;32],...
                      'SocialAttraction',2,...
                      'CognitiveAttraction',2); 
c1 = 1.49;
c2 = 1.49;
options = psooptimset(options, 'CognitiveAttraction', c1);
options = psooptimset(options, 'SocialAttraction', c2);
options = psooptimset(options, 'InertiaWeight', [0.75;0.05]);
options = psooptimset(options, 'Generations', 500);
[x, fval] = pso(@ackleysfcn,20,[],[],[],[],[],[],[],options);

%% constriction
options = psooptimset('DemoMode','fast',...
                      'PlotFcns',{@psoplotswarmsurf,@psoplotbestf,@psoplotvelocity},... 
                      'PopInitRange',[-32;32],...
                      'SocialAttraction',2,...
                      'CognitiveAttraction',2); 
c1 = 0.2679491924311227*4;
w = 0.2679491924311227;
c2 = 0.2679491924311227*2;
options = psooptimset(options, 'CognitiveAttraction', c1);
options = psooptimset(options, 'SocialAttraction', c2);
options = psooptimset(options, 'InertiaWeight', w);
options = psooptimset(options, 'Generations', 500);
[x, fval] = pso(@ackleysfcn,20,[],[],[],[],[],[],[],options);

