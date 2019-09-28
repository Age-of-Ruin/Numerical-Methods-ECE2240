clear all
close all
clc

% Initialize
interval = [0.5 2];
max_its = 100;
tol = 0.05;

% Acquire Results
trueResult = fzero(@rootFunction, 1)
[bisectResult, xlB, xuB, nB, errorB] = bisectionMethod(interval(1), interval(2), max_its, tol)
[falsePosResult, xlF, xuF, nF, errorF] = falsePosition(interval(1), interval(2), max_its, tol)

%Plot
xVals = linspace(0,3,1000);
yVals = rootFunction(xVals);  

figure(1)
plot(xVals,yVals)
hold on
plot(trueResult, 0, 'ro')
hold on
plot(bisectResult, 0, 'bo')
hold on
plot(falsePosResult, 0, 'go')
xlabel('x Values')
ylabel('f(x) Values')
title('Roots of f(x) = ln(x^4)-0.7')