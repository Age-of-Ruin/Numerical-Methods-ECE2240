function L = Li(xs, i, x)
%Calculates function evaluation the indiviual basis function 
%at a particular point using the xdata (xs) and a given point.

n = length(xs) - 1;

L = 0 * x + 1;

for j = 0:n
    
    if i ~= j
        L = L .* (x-xs(j+1)) / (xs(i+1) - xs(j+1));
    end
end
end