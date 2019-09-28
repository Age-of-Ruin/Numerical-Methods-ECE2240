close all
clear all
clc

%Initialize Data
x = [0 1.8 5 6 8.2 9.2 12];
y = [26 16.415 5.375 3.5 2.105 5.54 8];

%Evaluate at xVals
xVals = [3.5 7 8.5];
xVals2 = linspace(0,12);

%Calculate y values of splines
ySpline = quadSpline(x, y, xVals)
ySpline2 = quadSpline(x, y, xVals2);

%Plot
figure(1)
scatter(x,y)
hold on
plot(xVals, ySpline)
hold on
plot(xVals2, ySpline2);
title('Quadratic Splines')
xlabel('X Values')
ylabel('Y Values')
legend('Data', 'x = [3.5, 7, 8.5]', 'x exists in [0,12]');
