load('COVIDdata.mat');
covidda = table2array(COVID_STLmetro(:,5:6));
coviddata = covidda./2737140; % TO SPECIFY

t = length(coviddata); % TO SPECIFY
% The following line creates an 'anonymous' function that will return the cost (i.e., the model fitting error) given a set
% of parameters.  There are some technical reasons for setting this up in this way.
% Feel free to peruse the MATLAB help at
% https://www.mathworks.com/help/optim/ug/fmincon.html
% and see the sectiono on 'passing extra arguments'
% Basically, 'sirafun' is being set as the function siroutput (which you
% will be designing) but with t and coviddata specified.
sirafun= @(x)siroutput(x,t,coviddata);

%% set up rate and initial condition constraints
% Set A and b to impose a parameter inequality constraint of the form A*x < b
% Note that this is imposed element-wise
% If you don't want such a constraint, keep these matrices empty.
A = [];
b = [];

%% set up some fixed constraints
% Set Af and bf to impose a parameter constraint of the form Af*x = bf
% Hint: For example, the sum of the initial conditions should be
% constrained
% If you don't want such a constraint, keep these matrices empty.
Af = [0, 0, 0, 1, 1, 1, 1];
bf = 1;

%% set up upper and lower bound constraints
% Set upper and lower bounds on the parameters  
% lb < x < ub
% here, the inequality is imposed element-wise
% If you don't want such a constraint, keep these matrices empty.
% ub = [1, 1, 1, 1, 1, 1, 1]';
% lb = [0, 0, 0, 0, 0, 0, 0]';
ub = [0.09, 0.005, 0.06, 1, 0.1, 0, 0]';
lb = [0, 0, 0, 1 ,0,0,0]';

% Specify some initial parameters for the optimizer to start from
x0 = [0.0812, 0.011, 0.59, 1, 0, 0, 0]; 

% This is the key line that tries to opimize your model parameters in order to
% fit the data
% note tath you 
x = fmincon(sirafun,x0,A,b,Af,bf,lb,ub);

%plot(Y);
%legend('S','I','R','D');
%xlabel('Time')

Y_fit = siroutput_full(x,t);
Y_fit_DC = ones([t,1])'-Y_fit(1:t,1);

% Make some plots that illustrate your findings.
% TO ADD
figure;
hold on;
plot(coviddata);
plot(Y_fit_DC);
legend('cases','deaths','Y fit deaths', 'Y fit cases');
title("Original data and Y fit")
hold off;


%%
% Changes based on policies
infection_multiplier = 0.8;
% fatality_multiplier = 1;
% recover_multiplier = 1.2;
ub = [x(1)*infection_multiplier, 0.005, 0.06, 1, 0.1, 0, 0]';
lb = [0, 0, 0, 1 ,0,0,0]';
xnew = fmincon(sirafun,x0new,A,b,Af,bf,lb,ub);
disp(xnew(1))
Y_fitnew = siroutput_full(xnew,t);
Y_fit_DCnew = ones([t,1])'-Y_fitnew(1:t,1);
figure;
hold on;
plot(coviddata);
plot(Y_fit_DCnew);
legend('cases','deaths','Y fit deaths new', 'Y fit cases new');
title("Original data and Y fit new")
hold off;