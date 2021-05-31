% Engineering Analysis 3
% Homework 1
% Alexander Ross

% % Part B

% Spring Response Graph
syms xs
Fs = piecewise(xs<-4, Inf, -4<xs<4, xs, xs>4, (xs/2)+2);
fplot(Fs);
xlim([-10 10]);
ylim([-6 6]);
xlabel('xs (mm)');
ylabel('Fs (N)');
legend('Fs(xs)');
title('Spring Response');

% Damper Response Graph
syms vd
Fd = piecewise(vd<0, vd, vd>0, vd/2);
fplot(Fd);
xlim([-10 10]);
ylim([-6 6]);
xlabel('vd (mm/s)');
ylabel('Fd (N)');
legend('Fd(xd)');
title('Damper Response');

% % Part C

syms xs
Fs = piecewise(xs<-4, Inf, -4<xs<4, xs, xs>4, (xs/2)+2);
Fd = -Fs;
vd = piecewise(Fd<0, Fd, Fd>0, Fd*2);
vs = vd;
fplot(vs);
xlim([-10 10]);
ylim([-8 8]);
xlabel('xs (mm)');
ylabel('xv (mm/s)');
legend('xv(xs)');
title('Spring Velocity vs Displacement');
