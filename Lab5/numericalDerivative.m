function [df] = numericalDerivative(x, f, type)
%This funciton will implement numerical differentiation using
%data provided via the inputs x (x values) and f (function values).
%It will offer a selection of the method to acquire the results, 
%either using the forward, back or centered difference approximation.

%Initialize
df = zeros(1,length(x));
h = x(2) - x(1); %equally spaced points

%Acquire method of differentiation
FL = strcmp(type, "FL");
BL = strcmp(type, "BL");
CL = strcmp(type, "CL");
FM = strcmp(type, "FM");
BM = strcmp(type, "BM");
CM = strcmp(type, "CM");

%Perform differentiation
%Less accurate forward diff approx (2 point) - O(h)
if(FL)
    
    %Calculate derivative
    for i = 1:length(x)-1
    
        df(i) = (f(i+1) - f(i)) / h;
    
    end
    
    %Handle end point (using backward diff approx  - O(h))
    df(end) = (f(end) - f(end-1)) / h;
    
%Less accurate backward diff approx (2 point) - O(h)
elseif(BL)
        
    %Calculate derivative
    for i = 2:length(x)
    
        df(i) = (f(i) - f(i-1)) / h;
    
    end
    
    %Handle start point (using forward diff approx)  - O(h)
    df(1) = (f(2) - f(1)) / h;
    
%Less accurate centered diff approx (2 point) - O(h^2)
elseif(CL)
    
    %Calculate derivative
    for i = 2:length(x)-1
    
        df(i) = (f(i+1) - f(i-1)) / (2*h);
    
    end
    
    %Handle start & end point (using 3 point fwd and back) - O(h^2)
    df(1) = (-f(3) + 4*f(2) - 3*f(1)) / (2*h);
    df(end) = (3*f(end) - 4*f(end-1) + f(end-2)) / (2*h);
    
%More accurate forward diff approx (3 point) - O(h^2)
elseif(FM)
    
    %Calculate derivative
    for i = 1:length(x)-2
    
        df(i) = (-f(i+2) + 4*f(i+1) - 3*f(i)) / (2*h);
    
    end
    
    %Handle end points (using 3 point back) - O(h^2)
    df(end-1) = (3*f(end-1) - 4*f(end-2) + f(end-3)) / (2*h);
    df(end) = (3*f(end) - 4*f(end-1) + f(end-2)) / (2*h);
  
%More accurate backward diff approx (3 point) - O(h^2)
elseif(BM)
        
    %Calculate derivative
    for i = 3:length(x)
    
        df(i) = (3*f(i) - 4*f(i-1) + f(i-2)) / (2*h);
    
    end
    
    %Handle start points (using 3 point fwd) - O(h^2)
    df(1) = (-f(3) + 4*f(2) - 3*f(1)) / (2*h);
    df(2) = (-f(4) + 4*f(3) - 3*f(2)) / (2*h);
    
%More accurate centered diff approx (3 point) - O(h^4)
elseif(CM)
    
    %Calculate derivative
    for i = 3:length(x)-2
    
        df(i) = (-f(i+2) + 8*f(i+1) - 8*f(i-1) + f(i-2)) / (12*h);
    
    end
    
    %Handle start & end points (using 3 point fwd and back) - O(h^2)
    df(1) = (-f(3) + 4*f(2) - 3*f(1)) / (2*h);
    df(2) = (-f(4) + 4*f(3) - 3*f(2)) / (2*h);
    df(end-1) = (3*f(end-1) - 4*f(end-2) + f(end-3)) / (2*h);
    df(end) = (3*f(end) - 4*f(end-1) + f(end-2)) / (2*h);
    
end

end