%Ld = b -> Ux = d
function [d] = fwdSub(L,b)

%declare size of input array (L)
[numOfRows,numOfCols] = size(L);

n = numOfRows;

%Perform operation on first entry (ie top row left column)
d(1) = b(1)/L(1,1);

% Work down the matrix to find a solution to every other row of d (from 2...n))
% by subtracting all known terms (ie for x(2), x(n) is known), and 
% dividing by the coeffecient (in this case A(n-1,n-1))
for i = 2:n
    
    sum = b(i);
    
     % subtract all known terms from d
    for j = 1:i-1
        sum = sum - (L(i,j) * d(j));
    end % end for
    
    d(i) = sum/L(i,i);
        
end % end for

%Transpose matrix to vertical (for visual aid)
d = d.';

end % end fwdSub

