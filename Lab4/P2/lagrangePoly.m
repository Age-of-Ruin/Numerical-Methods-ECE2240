function [y] = lagrangePoly(xdata, ydata, x)
%Calculates the function evalution of the nth order poly
%where n is the number of data points - 1

%Number of polys
n = length(ydata);
L = zeros(n);
y = 0;

for i = 0:n-1 % Loop over all data 
  
    %Construct Basis functions
    L(i+1) = Li(xdata, i, x);

    %Construct output
    y = y + ydata(i+1) * L(i+1);
end
end