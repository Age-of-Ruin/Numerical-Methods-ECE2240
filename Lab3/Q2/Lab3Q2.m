clear all
close all
clc

% Initialization
x0 = 0.05;
xm1 = 0.04;
tol = 0.05;
max_its = 100;

% Calculate results
trueResult = fzero(@currentFunction, x0)
[nrResult, nNR, errorNR] = newtonRaphson(x0, max_its, tol)
[smResult, nSM, errorSM] = secantMethod(xm1, x0, max_its, tol)


%Plot
xVals = linspace(0,3,1000);
yVals = currentFunction(xVals);  

figure(1)
plot(xVals,yVals)
hold on
plot(trueResult, 0, 'ro')
hold on
plot(nrResult, 0, 'bo')
hold on
plot(smResult, 0, 'go')
xlabel('t Values (time - seconds)')
ylabel('f(t) Values')
title('Roots of f(t) = 9e^-t * cos(2*pi*t) - i')