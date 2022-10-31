result = [];
x0 = [1; 0; 0; 0];
for index = 1:1000

  % Initial population is a hundred percent susceptible
                    % to the new disease before the start of the epidemic.
                    % The four entries correspond to the portion of 
                    % susceptible, infected, recovered and deceased
                    % populatoin.

A = [0.95, 0.04,  0.05, 0;    % A is the update matrix of how the disease evolve
     0.05, 0.85,  0, 0;    % within the population. Note that the 4th column of
     0,    0.10,  0.95, 0;    % the matrix is all 0 except for the last entry since
     0,    0.01,  0, 1];   % deceased people must remain dead. Also, each column
                         % must add up to 1 since we are assuming that the
                         % population is a closed population.

xt = A * x0;        % The updated version of the infectious disease after
                    % one unit time in the population.

x0 = xt;

result = [result xt];
end

figure;
plot(result');