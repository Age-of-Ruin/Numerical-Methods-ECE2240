N=100 to N=1000 :
-	Expect a 1000x increase
-	Only see about 300x increase 
%Find matrix inverse
function [Ainv] = matrixInv(A)

%declare size of input array (A)
[numOfRows,numOfCols] = size(A);

n = numOfRows;

%Generate identity matrix which will 'select'
%each row of Ainv
bI = eye(n);

%Perform LU Decomp A ->LU
[L,U] = LUDecomp(A);

% loop over all rows
for i = 1:n
    
    % Split identity into  vectors containing 1 at appropriate entry
    b = bI(:,i);

    % Calculate 1 row of Ainv
    
    % Ld = b -> Ux = d
    [d] = fwdSub(L,b); 

    % Ux = d -> solve x 
    [x] = backSub(U,d);

    % set col = transformed identity matrix
    Ainv(:,i) = x;

end % end for 

end % end matrixInv