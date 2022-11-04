t1 = 10;
t2 = 100;
t = t2 - t1 + 1;
data1 = table2array(COVID_STLmetro(t1:t2,"cases"))/2737140;
data2 = table2array(COVID_STLmetro(t1:t2,"deaths"))/2737140;
coviddata = [data1 data2];

sirafun= @(x)siroutput(x,t,coviddata);
A = [];
b = [];
Af = [0, 0, 0, 1, 1, 1, 1];
bf = 1;
ub = [0.01, 0.002, 0.005, 1, 0.001, 0.01, 0.01]';
lb = [0.00001, 0.00001, 0.00001, 0.9 ,0,0,0]';
% ub = [1, 0.9, 0.9, 1, 1, 1, 0.9]';
% lb = [0, 0, 0, 0, 0, 0, 0]';
% x0 = [0.0812, 0.011, 0.59, 1, 0, 0, 0]; 
x0 = [0.002, 0.00001, 0.01, 0.9999, 0.0001, 0, 0];
xnew = fmincon(sirafun,x0,A,b,Af,bf,lb,ub);
Y_fitah = siroutput_full(xnew,t);

% Y_fittry = siroutput_full(xnew,t);
% Y_fit_24try = [Y_fittry(:,2) Y_fittry(:,4)];
figure;
hold on;
% plot(coviddata);
% plot(Y_fit_24try);
plot(t1:t2,data1);
plot(t1:t2,data2);

model_inf = Y_fitah(1:t,2);
plot(t1:t2,model_inf);
model_deaths = Y_fitah(1:t,4);
plot(t1:t2,model_deaths);
legend('data1','data2','model inf','model deaths');
title("Original data and Y fit24try")
hold off;