function [t, v_analytic, v_numerical] = falling_parachute(c,m,g,dt)

%create the t vector from0 seconds to 12 seconds in steps of delta t
t = 0:dt:12;

%determine the length of the t vector (for later use);
N = length(t);

%calculate the analytic solution
v_analytic = g*m*(1-exp(-(c/m)*t))/c;

%finite difference solution
%create a vector of lenght N filled with zeros
%used to store the numerical solution
v_numerical = zeros(1,N);

%using a for loop, determine each value of the velocity numerically
%typically we set the inital condition here in v(1)
%but we have already initialized the entire array to 0
for count = 1:(N-1)
    v_numerical(count+1) = v_numerical(count) + (g-(c/m)*v_numerical(count))*dt;
end