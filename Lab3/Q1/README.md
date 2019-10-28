# Root Finding (Bisection and False Position Methods)

Function: f(x) = log(x.<sup>4</sup>) - 0.7

## Bisection Method
Approximates the root of the above function by continuously halving the interval then inspecting the function evaluation. This continues until an estimate of the root is located with relative error less than the user supplied tolerance. 

## False Position Method
Approximates the root of the above function by finding a root located on a straight line between the endpoints of the interval. The program then evalutes the function at this point, then uses this as the end point for the next interval calculation. This continues until an estimate of the root is located with relative error less than the user supplied tolerance. 