%Ax = b -> Ux=d (upper triangular)
function [U,d] = fwdElimV2(A,b)

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

            %subtract (factor * row k) from row i (of input A)
            %NOTE: THIS DOES ALL ENTRIES IN THE ROW
            A(i,:) = A(i,:) - factor * A(k,:); 

            % subtract factor * row k from row i (of result b)
            b(i) = b(i) - factor*b(k); 
        
        % throw error if pivot = 0 (and quit)
        else
            
            error('Error - Encounter 0 pivot - Quitting program')
            %quit
            
        end % end if-else   
    end % end for
end % end for

% Set U and d equal to results
U = A;
d = b;

end % end fwdElimV2