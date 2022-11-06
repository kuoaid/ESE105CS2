load('COVIDdata.mat');
load('mockdata.mat');

t1 = 1;
t2 = 365;
t = t2 - t1 + 1;
coviddata = [newInfections(t1:t2)' cumulativeDeaths(t1:t2)'];
sirafun= @(x)siroutput_withVacc(x,t,coviddata);
A = [];  
b = [];
Af = [0 0 0 0 0 1 1 1 1 1];
bf = 1;
ub = [];
lb = [];
%x0 = [0.05, 0.01, 0.01, 0.01, 0.00001 0.999, 0.001,0,0,0]; 
x0 = [0.0812, 0.011, 0.59, 0.01, 0.0001, 1, 0, 0, 0, 0]; 
x = fmincon(sirafun,x0,A,b,Af,bf,lb,ub);

Y_fit = siroutput_full_withVacc(x,t);
Y_fit_DC = ones([t,1])-Y_fit(1:t,1)-Y_fit(1:t,5);

figure;
hold on;
plot(coviddata);
plot(Y_fit_DC);
plot(Y_fit(1:t,4));
hold off;
title("Mock COVID data");
xlabel("Days");
ylabel("Fraction of total population");
legend('Cases','Deaths','Y fit cases','Y fit deaths');
