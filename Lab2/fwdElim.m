%Ax = b -> Ux=d (upper triangular)
function [U,d] = fwdElim(A,b)

%declare size of input array (A)
[numOfRows,numOfCols] = size(A);

n = numOfRows;

%loop over each pivot row (no pivot on last row)
for k = 1:n-1 
    
    % loop over each row below pivot
    for i = k+1:n 
        
        % execute as long as pivot != 0
        if (A(k,k) ~= 0)

            %divide every entry below pivot A(i,k) by A(k,k) pivot
            factor = A(i,k)/A(k,k); 
            
            % only goes over upper triangular portion - need to zero lower triangular part
            for j = k+1:n 
                
                %subtract factor * row k from row i (of input A)
                A(i,j) = A(i,j) - factor * A(k,j); 
            
            end % end for
            
            % subtract factor * row k from row i (of result b)
            b(i) = b(i) - factor*b(k); 
        
        % throw error if pivot = 0 (and quit)
        else 
            
            error('Error - Encounter 0 pivot - Quitting program')
            %quit
            
        end % end if-else   
    end % end for
end % end for

% Set U to the upper triangular part of the result
% and d equal to the transformed b matrix
U = triu(A);
d = b;

end % end fwdElim