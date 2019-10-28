# Mathlab Intro and Euler's Method
## Part 1
Introduction to MATLAB that utilizes vector operations to calulate and plot the sum S<sub>k</sub>(x) = 1 + x + x<sup>2</sup> + x<sup>3</sup> + . . . + x<sup>k−1</sup> + x<sup>k</sup> where k = 5, 10, 20 for x = 0.1, 0.2, 0.3, 0.4, 0.5. 

## Part 2a
Numerically solved the velocity of a falling body (ie a falling object in a parachute) by comparing the analytical solution (v = gm(1-e<sup>-(c/m)*t</sup>/c) to the numerical solution (v<sub>n+1</sub> = v<sub>n</sub> + (g - (c/m)v<sub>n</sub>)dt. Note: v-velocity, c-drag coefficient, m-mass, t-time.

## Part 2b
Numerically solved an RC circuit for the capacitor voltage. This involved comparing the analytical solution (V<sub>c</sub> = e<sup>-t/RC</sup>) to the numerical solution acquired using Euler's Method (V<sub>n+1</sub> = V<sub>n</sub>(1-dt/RC)). Note: V-Voltage, R-Resistance, C-Capacitance, t-time.