close all
clear all
clc

%Initialize
xdataA2 = [8 12];
ydataA2 = [log(8) log(12)];
xdataB2 = [9 11];
ydataB2 = [log(9) log(11)];
xdataC3 = [8  9 11];
ydataC3 = [log(8) log(9) log(11)];
x = 10;

%State true value
yTrue = log(x)

%Case A
yA = lagrangePoly(xdataA2, ydataA2, x)
truePercentRelativeErrorA = abs((yTrue - yA)/yTrue)*100

%Case B
yB = lagrangePoly(xdataB2, ydataB2, x)
truePercentRelativeErrorB = abs((yTrue - yB)/yTrue)*100

%Case C
yC = lagrangePoly(xdataC3, ydataC3, x)
truePercentRelativeErrorC = abs((yTrue - yC)/yTrue)*100

%Approximate Percent Relative error
approxPercentRelativeErrorAC = abs((yC-yA)/yC)*100
approxPercentRelativeErrorBC = abs((yC-yB)/yC)*100