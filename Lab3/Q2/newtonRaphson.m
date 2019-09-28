function [xroot, n, error] = newtonRaphson(x0, max_its, tol)
%This function will implement the Newton Raphson method of root finding.
%It will take x0 as the initial guess and stop after max_its or tol

for n = 1:max_its
   
    if (n == 1) % 1ST ITERATION

        % Calculate root estimate
        fx0 = currentFunction(x0);
        dfx0 = currentFunctionDeriv(x0);
        xroot = x0 - (fx0/dfx0);
        
        % Check stopping condition
        error = abs((xroot - x0)/xroot)*100;
        if (error < tol)
            return
        end % end if
    
    else % 2ND, 3RD, 4TH... ITERATION
        
        % Calculate root estimate
        fx = currentFunction(xroot);
        dfx = currentFunctionDeriv(xroot);
        nextRoot = xroot - (fx/dfx);
        
        % Check stopping condition
        error = abs((nextRoot - xroot)/nextRoot)*100;
        if (error < tol)
            return
        end % end if
        
        % Update root estimate
        xroot = nextRoot;
        
    end % end if-else

end % end for
end % end newtonRaphson