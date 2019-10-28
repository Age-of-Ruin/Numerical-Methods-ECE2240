# Root Finding (Newton Raphson and Secant Methods)

Function: f(t) = 9e<sup>-t</sup> * cos(2*pi*t) - i

## Newton Rapshon Method 
Approximates the root of the above function by first calculating the root of the tangent line/derivative function at an abitrary position (ie initial guess). It then evaluates the function at this estimate and uses this point to calulate the next tangent line. The process then continues until then converges to the root closest to the initial guess. 

## Secant Method
Approximates the root of the above function using the secant method (ie finite difference version of Newton Raphson).