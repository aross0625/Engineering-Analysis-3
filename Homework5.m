% Engineering Analysis 3
% Homework 5
% Alexander Ross

%% Question 4-2

clear;
clc;

% Parameters
k = 900; % N/m
m = 400; % kg

% Initial Conditions
dt = 0.1; % timestep
t(1) = 0; % sec
A = [0, 1; -k/m, 0]; % for use in state equation x' = A x
x(:,1) = [0.5, 0]'; % initial conditions xs = 0.5, vm = 0

% Analytical Solution
timeInterval = [0:dt:20];
analyticalSolution = (0.5*cos((k/m)*timeInterval))+(0*(sqrt(m/k))*sin(sqrt(k/m*timeInterval)));
analyticalSolution2 = (sqrt(k/m)*(-0.5*sin(sqrt(k/m)*timeInterval)+0*cos(sqrt(k/m)*timeInterval)));

% Computation
for i = 1:200
   xprime = A * x(:,i);
   x(:,i+1) = x(:,i) + dt * xprime;
   t(i+1) = t(i) + dt;
end

% Plotting
plot(t, x, timeInterval, analyticalSolution, '-.' ,timeInterval, analyticalSolution2);
xlabel('time (sec)');
legend('Xs','Vm','Xs (Analytical)', 'Vm (Analytical)')

%% Question 4-3

% Parameters
k2 = 900; % N/m
m2 = 400; % kg

% Initial Conditions
dt2 = 0.1; % timestep
t2(1) = 0; % sec
A2 = [0, 1; -k2/m, 0]; % for use in state equation x' = A x
x2(:,1) = [0.5, 0.9]'; % initial conditions xs = 0.5, vm = 0.9

% Analytical Solution
timeInterval2 = [0:dt:20];
analyticalSolution3 = (0.5*cos((k2/m)*timeInterval2))+(0.9*(sqrt(m/k2))*sin(sqrt(k2/m*timeInterval2)));
analyticalSolution4 = (sqrt(k2/m)*(-0.5*sin(sqrt(k2/m)*timeInterval2)+0.9*cos(sqrt(k2/m)*timeInterval2)));

% Computation
for i = 1:200
   xprime2 = A * x(:,i);
   x2(:,i+1) = x(:,i) + dt * xprime;
   t2(i+1) = t(i) + dt;
end

% Plotting
plot(t, x, t2,x2);
xlabel('time (sec)');
legend('Xs (Vm(0) = 0)','Vm (Vm(0) = 0)','Xs (Vm(0) = 0.9)','Vm (Vm(0) = 0.9)')