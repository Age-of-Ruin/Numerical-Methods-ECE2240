function [t,v_analytic,v_numerical] = rc_circuit(R,C,dt)

%create the t vector from0 seconds to 2 seconds in steps of delta t
t = 0:dt:.002;

%determine the length of the t vector (for determining solution);
N = length(t);

%calculate the analytic solution
v_analytic = exp(-t/(R*C));

%create a vector of length N filled with zeros
%used to store the numerical solution
v_numerical = zeros(1,N);

%Starting value of Vc (Inital Condition)
v_numerical(1) = 1;

%use loop to determine each discrete value of solution
for count = 1:(N-1)
    v_numerical(count+1) = v_numerical(count)*(1-(dt/(R*C)));
end