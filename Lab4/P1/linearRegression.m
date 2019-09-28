function [a0, a1, Syx, r] = linearRegression(x, y)
%This function computes the linear regression coefficients,
%a0 and a1, as well as the standard error Syx and correlation
%coefficient r.

%Aquire number of points
n = length(x);

%sumXiYi
sumXY = sum(x.*y);

%sumXSquared
sumXX = sum(x.^2);

%sumX
sumX = sum(x);

%sumYi
sumY = sum(y);

%xMean
xMean = sumX/n;

%yMean
yMean = sumY/n;

%a1
a1 =((n * sumXY) - (sumX * sumY))/((n * sumXX) - sumX^2);

%a0
a0 = yMean - a1*xMean;

%St
St = sum((y - yMean).^2);

%Sr
Sr = sum((y - (a0 + a1 * x)).^2);

%Syx
Syx = sqrt(Sr / (n - 2));

%r
r = sqrt((St - Sr)/St);

end