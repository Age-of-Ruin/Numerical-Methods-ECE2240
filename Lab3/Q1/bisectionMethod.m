function [xroot, xl, xu, n, error] = bisectionMethod(xl0, xu0, max_its, tol)
%This function will implement the bisection root finding method.
%It will take upper and lower bounds (xl0 and xu0), the max number
%of iterations (max_its) as well as the tolerance (tol) and will 
%return the approximation of the root (xroot).

for n = 1:max_its
   
    if (n == 1) % 1ST ITERATION
        
        % Initial estimate of root (ie midpoint)
        xroot = (xl0 + xu0)/2;

        % Evaluate function at each location
        fxl = rootFunction(xl0);
        fxu = rootFunction(xu0);
        fxroot = rootFunction(xroot);
        
        % Check which new interval the root resides in
        lowerCheck = fxl*fxroot;
        upperCheck = fxroot*fxu;
        
        % Set new interval appropriately
        if (lowerCheck < 0)
            xl = xl0;
            xu = xroot;
            fxu = fxroot;
        elseif (upperCheck < 0)
            xl = xroot;
            xu = xu0;
            fxl = fxroot;
        else
            error('Root not located within interval')
        end % end if-else
    
        % Calculate next root and check stopping condition
        nextRoot = (xl + xu)/2;
        error = abs((nextRoot - xroot)/nextRoot)*100;
        if (error < tol)
            return
        end % end if
        
    else % 2ND, 3RD, 4TH... ITERATION     
        
        % Update root estimate
        xroot = nextRoot;

        % Evaluate function at root
        fxroot = rootFunction(xroot);
        
        % Check which new interval the root resides in
        lowerCheck = fxl*fxroot;
        upperCheck = fxroot*fxu;
        
        % Set new interval appropriately
        if (lowerCheck < 0)
            xu = xroot;
            fxu = fxroot;
        elseif (upperCheck < 0)
            xl = xroot;
            fxl = fxroot;
        else
            error('Root not located within interval')
        end %end if-else
        
        % Calculate next root and check stopping condition 
        nextRoot = (xl + xu)/2;
        error = abs((nextRoot - xroot)/nextRoot)*100;
        if (error < tol)
            return
        end % end if

    end % end if-else
end % end for
end % end bisectionMethod