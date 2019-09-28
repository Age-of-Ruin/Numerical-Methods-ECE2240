clear all
close all
clc

%Initialize Data
x = [6 7 11 15 17 21 23 29 29 37 39];
y = [29 21 29 14 21 15 7 7 13 0 3];

%Calculate Linear Regression Parameters
[a0, a1, Syx, r] = linearRegression(x, y)

%Calculate Linear Regression Line
[yReg] = regressionLine(a0, a1, x);

%Plot
figure(1)
scatter(x, y) %scatter plot
hold on
plot(x, yReg) %regression line
title('Linear Regression')
xlabel('X Values')
ylabel('Y Values')
legend('Data', 'Regression Line');