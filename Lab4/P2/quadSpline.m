function [y] = quadSpline(xdata, ydata, x)
%Will compute a quadradtic splines of data provided at given x value.

% Check for more than 1 data point (cannot fit curve to 1 point)
if (length(xdata) > 1)

    %Initialize
    numDataPoints = length(xdata); % n
    numIntervals = numDataPoints - 1; % n - 1
    numIntPoints = numDataPoints - 2; % n - 2
    numEqns = numIntervals * 3; % need to fit 2nd order poly (w/ 3 coeffs)

    %Construct matrices to house equations
    b = zeros(numEqns, 1);

    A = zeros(numEqns, numEqns);

    %Set up matrix using of unknowns xdata and ydata
    
    %%%% FIRST 3 * i equations where i = 0, 1, 2... %%%%
    %Interior Points (consists of 3 * numIntPoints equations) 
    if(numIntPoints > 0)
        for i = 1:numIntPoints
            start = 3 * i - 2;
            stop = 3 * i;

            %This fills in function i to left of xi (Eqn i)
            A(start, start:stop) = [1 xdata(i+1) xdata(i+1)^2];
            b(start, 1) = ydata(i+1);
            
            %This fills in function i+1 to the right of xi (Eqn i+1)
            A(start+1, start+3:stop+3) =  [1 xdata(i+1) xdata(i+1)^2];
            b(start+1, 1) = ydata(i+1);    
            
            %Set derivatives of interior points = to each other (Eqn i+2)
            A(start+2, start+1:stop+3) = [1 2*xdata(i+1) 0 -1 -2*xdata(i+1)];
            b(start+3, 1) = 0;
        
        
        end
    end

    %%%% FINAL 3 EQUATIONS %%%%
    %End Points (fill in equations for end points)
    start = 3*numIntPoints;
    A(start+1, 1:3) = [1 xdata(1) xdata(1)^2];
    b(3*numIntPoints+1, 1) = ydata(1);
    
    A(3*numIntPoints+2, 3*numIntPoints+1:3*numIntPoints+3) = [1 xdata(end) xdata(end)^2];
    b(3*numIntPoints+2, 1) = ydata(end);
    
    %Make first spline linear (f''(x0) = 2ai,i+1 = 0)
    A(3*numIntPoints+3, 3) = 2; 
    b(3*numIntPoints+3, 1) = 0;
    
    
    %Calculate coefficients (Aa = b -> a = b\A)
    a = A\b;
    
    %Find interval in which each x resides
    xIntervals = zeros(length(x), 1);
    for i = 1:length(x)
        for j = 1:numDataPoints-1
            if(x(i) >= xdata(j) && x(i) <= xdata(j+1))
                
                xIntervals(i, 1) = j;
                
            end
            
        end
        
    end
    
    %Final Solution (using coefficients from equation matrix)
    y = zeros(length(x), 1);
    coeff_indices = 3 .* xIntervals - 2;
    for i = 1:length(y)
        y(i) = a(coeff_indices(i, 1)) + a(coeff_indices(i, 1)+1) .* x(i) + a(coeff_indices(i, 1)+2) .* x(i)^2;
    end
else
    error('Please enter more data ( >1 data point)')
end

end