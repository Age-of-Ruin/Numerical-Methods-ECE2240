function [f] = currentFunctionDeriv( t )
%This function will calculate the result of the derivative at t

% Calculate result of derivative
f = -18*pi*exp(-t)*sin(2*pi*t)-9*exp(-t)*cos(2*pi*t);

end % end currentFunctionDeriv