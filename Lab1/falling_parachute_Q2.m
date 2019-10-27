function [t, v_analytic, v_numerical] = falling_parachute_Q2(c,m,g,t1,t2,dt)

%create the t vector from 0 seconds to 12 seconds in steps of delta t
t = t1:dt:t2;

%determine the length of the t vector (for later use);
N = length(t);

%calculate the analytic solution
v_analytic = g*m*(1-exp(-(c/m)*t))/c;

%finite difference solution
%create a vector of length N filled with zeros
%used to store the numerical solution
v_numerical = zeros(1,N);

%Starting value of Velocity (Inital Condition)
if(t1 == 0)
    v_numerical(1) = -20;
end

%using a for loop, determine each value of the velocity numerically
%typically we set the inital condition here in v(1)
%but we have already initialized the entire array to 0
for count = 1:(N-1)
    v_numerical(count+1) = v_numerical(count) + (g-(c/m)*v_numerical(count))*dt;
end