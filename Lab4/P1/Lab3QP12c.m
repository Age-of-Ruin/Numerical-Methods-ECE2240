clear all
close all
clc

%Initialize Data
x = [0.75 2 3 4 6 8 8.5];
y = [1.2 1.95 2 2.4 2.4 2.7 2.6];

%Quadratic/Parabolic Regression

%System of equations (from lecture 11)
n = length(x);
sumX = sum(x);
sumXX = sum(x .^ 2);
sumXXX = sum(x .^ 3);
sumXXXX = sum(x .^ 4);

sumY = sum(y);
sumXY = sum(x .* y);
sumXXY = sum((x .^ 2) .* y);

A = [n, sumX, sumXX;
     sumX, sumXX, sumXXX;
     sumXX, sumXXX, sumXXXX];
 
b = [sumY; sumXY; sumXXY];

%Solve using Ax=b ie x = b/A = [a0; a1; a2]
coeffs = A\b;

a0 = coeffs(1)
a1 = coeffs(2)
a2 = coeffs(3)

%Calculate regression line
y_Quad = a0 + a1 * x + a2 * x .^2;

%Other parameters

%xMean
xMean = sum(x)/n;

%yMean
yMean = sum(y)/n;

%St
St = sum((y - yMean).^2);

%Sr
Sr = sum((y - (a0 + a1 * x + a2 * x .^2)).^2);

%Syx
Syx = sqrt(Sr / (n - 3)) % n-3 for 3 degrees of freedom

%r
r = sqrt((St - Sr)/St)

%Plot
figure(1)
scatter(x,y)
hold on
plot(x, y_Quad)
title('Quadratic Model')
xlabel('X Values')
ylabel('Y Values')
legend('Data', 'Quadratic Model');