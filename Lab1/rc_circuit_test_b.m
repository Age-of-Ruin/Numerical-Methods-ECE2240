%Init
clear all;
close all;
clc;

%Declare Variables
R1 = 1000; %[Ohm]
C1 = (1*10^-6); %[F]
dt = [.2e-3 .175e-3 .15e-3 .125e-3 .1e-3 .075e-3 .05e-3 .025e-3]; %[s]

N = length(dt);

%Loop over all values of dt and plot
figure
for i = 1:N
    
    [t, v_analytic, v_numerical] = rc_circuit(R1,C1,dt(i));
    subplot(2,1,1)
    plot(t, v_analytic);
    hold on
    plot(t, v_numerical);
    hold on
    
    percent_abs_error = 100*abs(v_analytic - v_numerical) ./ abs(v_analytic);
    subplot(2,1,2);
    plot(t,percent_abs_error);
    hold on

end
subplot(2,1,1)
title('Numerical vs Analytic Solutions for the RC Circuit Problem - Part B');
xlabel('t,s');
ylabel('Vc,V');
legend('Exact Analytic Solution', 'dt = .2ms', 'dt = .175ms', 'dt = .15ms',...
       'dt = .125ms', 'dt = .1ms', 'dt = .075ms', 'dt = .05ms', 'dt = .025ms');

subplot(2,1,2);
title('Absolute % Error Between Analytic and Numerical Solution - Part B');
xlabel('t,s');
ylabel('Error,%');
legend('dt = .2ms', 'dt = .175ms', 'dt = .15ms', 'dt = .125ms', ...
       'dt = .1ms', 'dt = .075ms', 'dt = .05ms', 'dt = .025ms');