% Engineering Analysis 3
% Homework 2
% Alexander Ross

% % Question 3-3

% Parameters
k = 2000; % N/m
b = 1500; % N-s/m

% Analytical Solution
timeInterval = [0:0.05:5];
analyticalSolution = 0.05*exp(-1.333*timeInterval);

% Numerical Solution 1
dt1 = 0.5; % timestep
t1(1) = 0; % sec
x1(1) = 0.05; % m
for (i = 1:10)
    v1(i) = (-k/b) * x1(i);
    x1(i+1) = x1(i) + v1(i) * dt1;
    t1(i+1) = t1(i) + dt1;
end

% Numerical Solution 2
dt2 = 0.1; % timestep
t2(1) = 0; % sec
x2(1) = 0.05; % m
for (i = 1:50)
    v2(i) = (-k/b) * x2(i);
    x2(i+1) = x2(i) + v2(i) * dt2;
    t2(i+1) = t2(i) + dt2;
end

% Plotting
plot(t1, x1, '-', t2, x2, '--', timeInterval, analyticalSolution, '-.');
xlabel('time (sec)');
ylabel('displacement (m)');
legend('Numerical Solution 1 (dt=0.5s)', 'Numerical Solution 2 (dt=0.1s)', 'Analytical Solution')

% % Question 3-7

% Parameters
k = 3000; % N/m
b = 200; % N-s/m
m = 100; % kg

% Numerical Solution
dt = 0.01; % timestep
t(1) = 0; % sec
x_spring(1) = -0.05; % m
v_mass(1) = 0; % m/s
for (i = 1:500)
    v_spring(i) = v_mass(i);
    x_spring(i+1) = x_spring(i) + v_spring(i) * dt;
    a_mass(i) = -(1/m)*(k*x_spring(i)+b*v_mass(i));
    v_mass(i+1) = v_mass(i) + a_mass(i) * dt;
    t(i+1) = t(i) + dt;
end

% Plotting
subplot(2,1,1);
plot(t, x_spring);
xlabel('time (sec)');
ylabel('spring displacement (m)');
subplot(2,1,2);
plot(t, v_mass);
xlabel('time (sec)');
ylabel('mass velocity (m/s)');


