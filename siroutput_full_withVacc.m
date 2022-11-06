%% This function takes three inputs
% x - a set of parameters
% t - the number of time-steps you wish to simulatex = [0.05, 0.01, 0.1, 0.9, 0.1, 0, 0];

function f = siroutput_full_withVacc(x,t)

% Here is a suggested framework for x.  However, you are free to deviate
% from this if you wish.

% set up transmission constants
k_infections = x(1);
k_fatality = x(2);
k_recover = x(3);
k_vaccinated = x(4);
k_break = x(5);

% set up initial conditions
ic_susc = x(6);
ic_inf = x(7);
ic_rec = x(8);
ic_fatality = x(9);
ic_vaccinated = x(10);

% Set up SIRD within-population transmission matrix
% Make A a larger matrix so that it could consider more situations
A = [1-k_infections-k_vaccinated, 0,                      0, 0, 0;
    k_infections,                 1-k_fatality-k_recover, 0, 0, k_break;
    0,                            k_recover,              1, 0, 0;
    0,                            k_fatality,             0, 1, 0;
    k_vaccinated,                 0,                      0, 0, 1-k_break];
B = zeros(5,1);

% Set up the vector of initial conditions
% Including the group of people who get vaccinated, which is a group
% seperated with others, so all 5 groups' percentage of population adds up
% to be 1.
x0 = [ic_susc ic_inf ic_rec ic_fatality ic_vaccinated];

% Here is a compact way to simulate a linear dynamical system.
% Type 'help ss' and 'help lsim' to learn about how these functions work!!
sys_sir_base = ss(A,B,eye(5),zeros(5,1),1);
y = lsim(sys_sir_base,zeros(t,1),linspace(0,t-1,t),x0);

% return the output of the simulation
f = y;
end
