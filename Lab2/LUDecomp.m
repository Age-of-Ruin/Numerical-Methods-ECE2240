%Ax = b -> LUx = b -> Ld = b
function [L,U] = LUDecomp(A)


%declare size of input array (A)
[numOfRows,numOfCols] = size(A);

n = numOfRows;

%first declare L as identity
L = eye(n);

%loop over each pivot row (no pivot on last row)
for k = 1:n-1 
    
    % loop over each row below pivot
    for i = k+1:n 
        
        % divide entry below pivot A(i,k) by A(k,k) pivot to acquire f(i,k)
        factor = A(i,k)/A(k,k); 
        
        % store factors in L matrix (L(i,k) = f(i,k))
        L(i,k) = factor; 
        
        % subtract (factor * row k) from row i (of input A)
        A(i,:) = A(i,:) - factor * A(k,:); 
    
    end % end for
end % end for

% Set U equal to fwdElim results (transformed A matrix)
U = A;

end % end LUDecomp
