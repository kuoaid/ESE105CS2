result = [];
x0 = [1; 0; 0; 0];
for index = 1:200

  % Initial population is a hundred percent susceptible
                    % to the new disease before the start of the epidemic.
                    % The four entries correspond to the portion of 
                    % susceptible, infected, recovered and deceased
                    % populatoin.

A = [0.95, 0.04,  0, 0;    % A is the update matrix of how the disease evolve
     0.05, 0.85,  0, 0;    % within the population. Note that the 4th column of
     0,    0.10,  1, 0;    % the matrix is all 0 except for the last entry since
     0,    0.01,  0, 1];   % deceased people must remain dead. Also, each column
                         % must add up to 1 since we are assuming that the
                         % population is a closed population.

xt = A * x0;        % The updated version of the infectious disease after
                    % one unit time in the population.

x0 = xt;

result = [result xt];
end

figure(1);
plot(result');

result2 = [];
x02 = [1; 0; 0; 0];
for index = 1:700
    B = [0.95, 0.04,  0.05, 0;    % B is the update matrix of how the disease evolve
     0.05, 0.85,  0, 0;    % within the population. This time we consider with the 
     0,    0.10,  0.95, 0; % possibility of reinfection, which some recovered 
     0,    0.01,  0, 1];   % people could change back to succeptible and stay there
                           % or change to infected afterwards.

    xt2 = B * x02;        % The updated version of the infectious disease after
                    % one unit time in the population.(With reinfection)

    x02 = xt2;
    result2 = [result2 xt2];
end

figure(2);
plot(result2');

