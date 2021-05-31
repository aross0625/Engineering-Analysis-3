% Engineering Analysis 3
% Homework 3
% Alexander Ross

% % Questions 1-2 & 1-3

% Parameters
k1 = 80000; % N/m
b2 = 8000; % Ns/m
m3 = 1000; % kg
k4 = 16000; % N/m
b5 = 2000; % Ns/m
m6 = 60; % kg
g = 9.81; % m/sec^2 

% Timestep
dt = 0.01; % sec

% Initial Conditions
t(1) = 0.0; % sec
x1(1) = -0.1299; % m
v3(1) = 0.0; % m/sec
x4(1) = -0.03675; % m
v6(1) = 0.0; % m/sec

% Derived Initial Conditions
xr(1) = 0; % m
vr(1) = 0.1*(cos(10*0)); % m/sec
xm6(1) = x1(1) + x4(1) + xr(1);
f6(1) = 0; % N

% Calculation
for i=1:200
    f6(i)=0;
    x1p=v3(i)-vr(i);
    v3p=x1(i)*(-1*k1/m3)+x4(i)*k4/m3-v3(i)*(b2+b5)/m3+v6(i)*b5/m3+vr(i)*b2/m3-g;
    x4p=-v3(i)+v6(i);
    v6p=x4(i)*(-1*k4/m6)+v3(i)*b5/m6-v6(i)*b5/m6+f6(1)/m6-g;
    x1(i+1)=x1(i)+x1p*dt;
    v3(i+1)=v3(i)+v3p*dt;
    x4(i+1)=x4(i)+x4p*dt;
    v6(i+1)=v6(i)+v6p*dt;
    t(i+1)=t(i)+dt;
    xr(i+1)=0.01*sin(10*t(i+1));
    vr(i+1)=0.1*cos(10*t(i+1));
    xm6(i+1)=x1(i+1)+x4(i+1)+xr(i+1);
end

% Plotting
subplot(211);
plot(t,v6);
xlabel('time (sec)');
ylabel(' Velocity of Mass 6 (m/s)');
subplot(212);
plot(t,xm6);
xlabel('time (sec)');
ylabel(' Displacement of Mass 6 (m)')
