%%
% Engineering Analysis 3
% Homework 3
% Alexander Ross

%% Questions 3-2, 3-4, and 3-5

% Parameters
k=1500;
b=1000;
m=200;

% Initial Conditions
t(1)=0;
xs(1)=-0.05; 
vm(1)=0; 
dt=0.01; 
f(1)=0; 
e(1)=0.5*k*(xs(1))^2

% Calculations
for i=1:800
   t(i+1)=t(i)+dt;
   if t(i+1)<=2
       f(i+1)=75*t(i+1)
   elseif t(i+1)<=4
       f(i+1)=300-75*t(i+1)
   else
       f(i+1)=0
   end
   am(i)=(f(i)-k*xs(i)-b*vm(i))/m;
   vm(i+1)=vm(i)+am(i)*dt;
   vs(i)=(f(i)-k*xs(i)-m*am(i))/b;
   xs(i+1)=xs(i)+vs(i)*dt;
   ps(i)=k*xs(i)*vs(i);
   pd(i)=b*vs(i)^2;
   e(i+1)=0.5*k*xs(i+1)^2;
end

% Plotting
figure(1)
plot(t,f);
xlabel('Time (s)');
ylabel('Force (N)');
legend('Force T (N)');
title('Force Profile');
%%%
figure(2)
plot(t,xs);
xlabel('Time (s)');
ylabel('Spring Displacement (m)');
legend('Spring Displacement (m)')
title('Spring Displacement');
%%%
figure(3)
plot(t(1:end-1),vs);
xlabel('Time (s)');
ylabel('Spring Velocity (m/s)');
legend('Spring Velocity (m/s)');
title('Spring Velocity');
%%%
figure(4)
plot(t,e);
xlabel('Time (s)');
ylabel('Energy (J)');
legend('Energy (J)');
title('Spring Energy');
%%%
figure(5)
plot(t(1:end-1),ps);
xlabel('Time (s)');
ylabel('Power (W)');
legend('Power (W)');
title('Spring Power');
%%%
figure(6)
plot(t(1:end-1),pd);
xlabel('Time (s)');
ylabel('Power (W)');
legend('Damper Power (W)');
title('Damper Power');