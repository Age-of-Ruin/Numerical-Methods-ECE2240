clear all;
close all;
clc;

m1 = 70; %[kg]
g1 = 9.81; %[m/s]
c1 = 12.5; %[kg/s]
dt1 = 0.1;
[t, v_analytic, v_numerical] = falling_parachute(c1,m1,g1,dt1);

%plot solution
figure
subplot(2,1,1)
plot(t,v_analytic);
hold on
plot(t,v_numerical,'r-');
title('Numerical vs Analytic Solutions for the Falling Parachute Problem');
xlabel('t,s');
ylabel('v,m/s');
legend('Exact Analytic Solution', 'Numerical Solution');
percent_abs_error = 100*abs(v_analytic - v_numerical) ./ abs(v_analytic);
subplot(2,1,2);
plot(t,percent_abs_error);
title('Absolute % Error Between Analytic and Numerical Solution');
xlabel('t,s');
ylabel('Error,%');
legend('Absolute % Error');