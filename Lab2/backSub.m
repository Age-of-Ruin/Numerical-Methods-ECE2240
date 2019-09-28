%Ux = d -> solve x
function [x] = backSub(U,d)

%declare size of input array (U)
[numOfRows,numOfCols] = size(U);

n = numOfRows;

%Start by perform operation on last entry (ie bottom row, right column)
x(n) = d(n)/U(n,n);

% Work up the matrix too find a solution to every other row of d (from n-1...1)
% by subtracting all known terms (ie for x(n-1), x(n) is known), and 
% dividing by the coeffecient (in this case A(n-1,n-1))
for i = n-1:-1:1
    
    sum = d(i);
    
    % subtract all known terms from d
    for j = i+1:n
        sum = sum - (U(i,j) * x(j));
    end
    
    %divide out coefficient of solution to be aquired
    x(i) = sum/U(i,i);
        
end % end for

%Transpose matrix to vertical (for visual aid)
x = x.';

end % end backSub