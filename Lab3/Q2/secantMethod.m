function [xroot, n, error] = secantMethod(xm1, x0, max_its, tol)

for n = 1:max_its
   
    if (n == 1) % 1ST ITERATION

        % Calculate root estimate
        fx0 = currentFunction(x0);
        fxm1 = currentFunction(xm1);
        xroot = x0 - ((fx0*(xm1-x0))/(fxm1-fx0));
        
        % Check stopping condition
        error = abs((xroot - x0)/xroot)*100;
        if (error < tol)
            return
        end % end if
        
        % Update relavent values
        xm1 = x0;
        fxm1 = fx0;
    
    else % 2ND, 3RD, 4TH... ITERATION
        
        % update root estimate
        fx = currentFunction(xroot);
        nextRoot = xroot - ((fx*(xm1-xroot))/(fxm1-fx));
        
        
        % Check stopping condition
        error = abs((nextRoot - xroot)/nextRoot)*100;
        if (error < tol)
            return
        end % end if
    
        % Update relevant values
        xm1 = xroot;
        xroot = nextRoot;
        fxm1 = fx;
        
    end % end if-else

end % end for
end % end secantMethod