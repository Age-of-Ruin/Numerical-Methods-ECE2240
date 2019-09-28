function [I] = numericalIntegration(x, f, type)
%This function will implement numerical integration using
%data provided via the inputs x (x values) and f (function values).
%It will offer a selection of the method to acquire the results, 
%either using the pulse, trapezoidal and Simpson's 1/3 approximation.

%Initialize
I = 0;
numIntervals = length(x) - 1;
h = x(2) - x(1); %equally spaced points

if(numIntervals > 0) %need at least 1 interval to work on
   
    %Acquire method of integration
    P = strcmp(type, "P");
    T = strcmp(type, "T");
    S = strcmp(type, "S");

%Perform Integration
    %Pulse Integration
    if(P)

    I = sum(f*h) - f(end)*h;

    %Trapezoidal Integration
    elseif(T)

        I = h * (sum(f) - f(1)/2 - f(end)/2);

    %Simpson's 1/3 rule
    elseif(S)

        %even numIntervals
        if(mod(numIntervals, 2) == 0)
            for i = 1:(numIntervals/2)
               
                I = I + (h/3) * (f(2*i-1) + 4*f(2*i) + f(2*i+1));
                
            end
            
        %odd numIntervals   
        else
            for i = 1:((numIntervals-1)/2)
               
                I = I + (h/3) * (f(2*i-1) + 4*f(2*i) + f(2*i+1));
                
            end  
            
            %final trapezoidal rule
            I = I + ((f(end) + f(end-1))/2 * h);
            
        end

    end
    
end

end