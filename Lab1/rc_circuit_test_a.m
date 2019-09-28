%Init
clear all;
close all;
clc;

%Declare Variables
R1 = 1000; %[Ohm]
C1 = (1*10^-6); %[F]
dt1 = 0.2e-3; %[s]

%Calc Analytic and Numerical Solutions
[t, v_analytic, v_numerical] = rc_circuit(R1,C1,dt1);

%Plot Analytic and Numerical Solutions
figure
subplot(2,1,1)
plot(t,v_analytic);
hold on
plot(t,v_numerical,'r-');
title('Numerical vs Analytic Solutions for the RC Circuit Problem - Part A');
xlabel('t,s');
ylabel('Vc,V');
legend('Exact Analytic Solution', 'Numerical Solution');

%Calc and Plot Percent Error
percent_abs_error = 100*abs(v_analytic - v_numerical) ./ abs(v_analytic);
subplot(2,1,2);
plot(t,percent_abs_error);
title('Absolute % Error Between Analytic and Numerical Solution - Part A');
xlabel('t,s');
ylabel('Error,%');
legend('Absolute % Error');