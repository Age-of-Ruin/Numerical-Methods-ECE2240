function [f] = currentFunction(t)
%This function will calculate the function f(t) = 9e^-t * cos(2*pi*t) - i

% Initialize
i = 3.5;

% Calculate result of function
f = 9.*exp(-t).*cos(2.*pi.*t)-i;

end % end currentFunction