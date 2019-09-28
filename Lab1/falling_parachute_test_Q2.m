%Init
clear all;
close all;
clc;

%Declare Variables
m1 = 80; %[kg]
g1 = 9.81; %[m/s]
c1 = 20; %[kg/s]
c2 = 50; %[kg/s]
dt1 = 1; %[s]

%Acquire Solution
[t1, v_analytic_1, v_numerical_1] = falling_parachute_Q2(c1,m1,g1,0,10,dt1);
[t2, v_analytic_2, v_numerical_2] = falling_parachute_Q2(c2,m1,g1,10,20,dt1);

v_analytic = cat(2,v_analytic_1,v_analytic_2);
v_numerical = cat(2,v_numerical_1,v_numerical_2);
t = cat(2,t1,t2);

%plot solution
figure
subplot(2,1,1)
plot(t,v_analytic,t,v_numerical);
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