%% Load data
clear all;
load sphere_data.mat

%% Initialize a som and train for P10
som_10 = newsom(P10, [10 10], 'hextop', 'linkdist', 100,5);
[som_P10, stats] = train(som_10, P10);

som_20 = newsom(P20, [10 10], 'hextop', 'linkdist', 100,5);
[som_P20, stats] = train(som_10, P20);

som_30 = newsom(P30, [10 10], 'hextop', 'linkdist', 100,5);
[som_P30, stats] = train(som_10, P30);

%%
% Check the winner for F1 and F2 
figure(1)
plotsomhits(som_P10, P10(:,1:100)),title("P1 F1 winners")
figure(2)
plotsomhits(som_P10, P10(:,101:200)),title("P1 F2 winners")

%% P1
% Check the winner for F1 and F2 
figure(3)
plotsomhits(som_P10, P10(:,1:100)),title("P1 F1 winners");
figure(4)
plotsomhits(som_P10, P10(:,101:200)),title("P1 F2 winners");
%% P2
% Check the winner for F1 and F2 
figure(5)
plotsomhits(som_P20, P20(:,1:100)),title("P2 F1 winners");
figure(6)
plotsomhits(som_P20, P20(:,101:200)),title("P2 F2 winners");

%% P3
% Check the winner for F1 and F2 
figure(7)
plotsomhits(som_P30, P30(:,1:100)),title("P3 F1 winners");
figure(8)
plotsomhits(som_P30, P30(:,101:200)),title("P2 F2 winners");


%% Plote the 3D P1
figure(9)
plotsom(som_P10.iw{1,1}, som_P10.layers{1}.distances)
hold on
plot3(P10(1,:), P10(2,:),P10(3,:), '+k')

%% Plote the 3D P2
figure(10)
plotsom(som_P20.iw{1,1}, som_P20.layers{1}.distances)
hold on
plot3(P20(1,:), P20(2,:),P20(3,:), '+k')

%% Plote the 3D P3
figure(11)
plotsom(som_P30.iw{1,1}, som_P30.layers{1}.distances)
hold on
plot3(P30(1,:), P30(2,:),P30(3,:), '+k')



%% Plot 1
% plotsomhits(som_P10, P30(:,1:100)),title("using P30 with som P10")
plotsomhits(som_P30, P10(:,1:100)),title("using P10 with som P30")
