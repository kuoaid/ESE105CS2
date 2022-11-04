load('COVIDdata.mat');
% 3.5 1
% for 1 model
t1 = 1;
t2 = 129;
t = t2 - t1 + 1;
data1 = table2array(COVID_STLmetro(t1:t2,"cases"))/2737140;
data2 = table2array(COVID_STLmetro(t1:t2,"deaths"))/2737140;
coviddata = [data1 data2];

sirafun= @(x)siroutput(x,t,coviddata);
A = [];
b = [];
Af = [0, 0, 0, 1, 1, 1, 1];
bf = 1;
ub = [0.09, 0.005, 0.06, 1, 0.1, 0, 0]';
lb = [0, 0, 0, 1 ,0,0,0]';
x0 = [0.008, 0.001, 0.01, 0.999, 0.001, 0, 0];
x = fmincon(sirafun,x0,A,b,Af,bf,lb,ub);
Y_fit_1 = siroutput_full(x,t);

% for 2 model
t1 = 130;
t2 = 240;
t = t2 - t1 + 1;
data1 = table2array(COVID_STLmetro(t1:t2,"cases"))/2737140;
data2 = table2array(COVID_STLmetro(t1:t2,"deaths"))/2737140;
coviddata = [data1 data2];

sirafun= @(x)siroutput(x,t,coviddata);
ub = [0.09, 0.05, 0.6, 0.9943,  0.1, 0, 0]';
lb = [0, 0, 0,  0.9943, 0, 0, 0]';
x0 = [0.008, 0.001, 0.01, 0.999, 0.001, 0, 0];
x = fmincon(sirafun,x0,A,b,Af,bf,lb,ub);
Y_fit_2 = siroutput_full(x,t);

% for 3 model
t1 = 241;
t2 = 337;
t = t2 - t1 + 1;
data1 = table2array(COVID_STLmetro(t1:t2,"cases"))/2737140;
data2 = table2array(COVID_STLmetro(t1:t2,"deaths"))/2737140;
coviddata = [data1 data2];

sirafun= @(x)siroutput(x,t,coviddata);
ub = [0.09, 0.005, 0.06, 0.9694, 0.1, 0, 0]';
lb = [0, 0, 0, 0.9694 ,0,0,0]';
x0 = [0.008, 0.001, 0.01, 0.999, 0.001, 0, 0];
x = fmincon(sirafun,x0,A,b,Af,bf,lb,ub);
Y_fit_3 = siroutput_full(x,t);

% for 4 model
t1 = 338;
t2 = 493;
t = t2 - t1 + 1;
data1 = table2array(COVID_STLmetro(t1:t2,"cases"))/2737140;
data2 = table2array(COVID_STLmetro(t1:t2,"deaths"))/2737140;
coviddata = [data1 data2];

sirafun= @(x)siroutput(x,t,coviddata);
ub = [0.09, 0.005, 0.06, 0.9041, 0.1, 0, 0]';
lb = [0, 0, 0, 0.9041,0,0,0]';
x0 = [0.008, 0.001, 0.01, 0.999, 0.001, 0, 0];
x = fmincon(sirafun,x0,A,b,Af,bf,lb,ub);
Y_fit_4 = siroutput_full(x,t);

% for 5 model
t1 = 494;
t2 = 651;
t = t2 - t1 + 1;
data1 = table2array(COVID_STLmetro(t1:t2,"cases"))/2737140;
data2 = table2array(COVID_STLmetro(t1:t2,"deaths"))/2737140;
coviddata = [data1 data2];

sirafun= @(x)siroutput(x,t,coviddata);
ub = [0.09, 0.005, 0.06, 0.8908, 0.1, 0, 0]';
lb = [0, 0, 0, 0.8908,0,0,0]';
x0 = [0.008, 0.001, 0.01, 0.999, 0.001, 0, 0];
x = fmincon(sirafun,x0,A,b,Af,bf,lb,ub);
Y_fit_5 = siroutput_full(x,t);

% for 6 model
t1 = 652;
t2 = 705;
t = t2 - t1 + 1;
data1 = table2array(COVID_STLmetro(t1:t2,"cases"))/2737140;
data2 = table2array(COVID_STLmetro(t1:t2,"deaths"))/2737140;
coviddata = [data1 data2];

sirafun= @(x)siroutput(x,t,coviddata);
ub = [0.09, 0.005, 0.06, 0.8446, 0.1, 0, 0]';
lb = [0, 0, 0, 0.8446,0,0,0]';
x0 = [0.008, 0.001, 0.01, 0.999, 0.001, 0, 0];
x = fmincon(sirafun,x0,A,b,Af,bf,lb,ub);
Y_fit_6 = siroutput_full(x,t);

% for 7 model
t1 = 706;
t2 = 798;
t = t2 - t1 + 1;
data1 = table2array(COVID_STLmetro(t1:t2,"cases"))/2737140;
data2 = table2array(COVID_STLmetro(t1:t2,"deaths"))/2737140;
coviddata = [data1 data2];

sirafun= @(x)siroutput(x,t,coviddata);
ub = [0.09, 0.005, 0.06, 0.7630, 0.1, 0, 0]';
lb = [0, 0, 0, 0.7630,0,0,0]';
x0 = [0.008, 0.001, 0.01, 0.999, 0.001, 0, 0];
x = fmincon(sirafun,x0,A,b,Af,bf,lb,ub);
Y_fit_7 = siroutput_full(x,t);

Y_fit_total = cat(1,Y_fit_1,Y_fit_2,Y_fit_3,Y_fit_4,Y_fit_5,Y_fit_6,Y_fit_7);

t1 = 1;
t2 = 798;
t = t2 - t1 + 1;
data1 = table2array(COVID_STLmetro(t1:t2,"cases"))/2737140;
data2 = table2array(COVID_STLmetro(t1:t2,"deaths"))/2737140;
coviddata = [data1 data2];
figure;
hold on;
plot(t1:t2,data1);
plot(t1:t2,data2);
model_I = ones([t,1])'-Y_fit_total(1:t,1);
plot(t1:t2,model_I);
model_D = Y_fit_total(1:t,4);
plot(t1:t2,model_D);
legend('data1','data2','model I','model D');
title("Original data and Y fit for 7 models")
hold off;


%%
% 3.5 2

t1 = 431;
t2 = 605;
t = t2 - t1 + 1;
data1 = table2array(COVID_STLmetro(t1:t2,"cases"))/2737140;
data2 = table2array(COVID_STLmetro(t1:t2,"deaths"))/2737140;
coviddata = [data1 data2];

sirafun= @(x)siroutput(x,t,coviddata);
ub = [0.09, 0.005, 0.06, 0.8961, 0.1, 0, 0]';
lb = [0, 0, 0, 0.8961,0,0,0]';
x0 = [0.008, 0.001, 0.01, 0.999, 0.001, 0, 0];
x = fmincon(sirafun,x0,A,b,Af,bf,lb,ub);
Y_fit_Delta = siroutput_full(x,t);
disp(x(1));

% The policy that reduce cases and deaths by 25%
sirafun= @(x)siroutput(x,t,coviddata);
ub = [1.6049e-04, 0.005, 0.06, 0.8961, 0.1, 0, 0]';
lb = [0, 0, 0, 0.8961,0,0,0]';
x0 = [0.008, 0.001, 0.01, 0.999, 0.001, 0, 0];
x = fmincon(sirafun,x0,A,b,Af,bf,lb,ub);
Y_fit_Delta_new = siroutput_full(x,t);


data1 = table2array(COVID_STLmetro(t1:t2,"cases"))/2737140;
data2 = table2array(COVID_STLmetro(t1:t2,"deaths"))/2737140;
coviddata = [data1 data2];
figure;
hold on;
plot(t1:t2,data1);
plot(t1:t2,data2);
model_I = ones([t,1])'-Y_fit_Delta(1:t,1);
plot(t1:t2,model_I);
model_D = Y_fit_Delta(1:t,4);
plot(t1:t2,model_D);
% new policy
model_I_new = ones([t,1])'-Y_fit_Delta_new(1:t,1);
plot(t1:t2,model_I_new);
model_D_new = Y_fit_Delta_new(1:t,4);
plot(t1:t2,model_D_new);
legend('data1','data2','model I','model D','model I new','model D new');
title("Original data and Y fit with 'Delta' variant and also the new policy")
hold off;
