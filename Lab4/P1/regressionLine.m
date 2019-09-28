function [y] = regressionLine(a0, a1, x)
%Constructs the regression line using the range 
%given by x and regression coeffcients a0 and a1.

y = a0 + a1 .* x;

end