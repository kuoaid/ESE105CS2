load('COVIDdata.mat');
load('mockdata.mat');

figure;
hold on;
plot(newInfections);
plot(cumulativeDeaths);
hold off;
title("Mock COVID data");
xlabel("Days");
ylabel("Fraction of total population");