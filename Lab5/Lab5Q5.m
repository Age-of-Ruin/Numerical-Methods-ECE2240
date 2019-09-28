close all
clear all 
clc

%Initialize
%%Bounds
xmin = -1;
xmax = 1;
ymin = -1;
ymax = 1;

%OddPoints
nxOdd = 51;
nyOdd = 51;

%Construct Functions (for odd numPoints)
dxOdd = (xmax - xmin)/(nxOdd-1);
dyOdd = (ymax - ymin)/(nyOdd-1);
x = xmin:dxOdd:xmax;
y = ymin:dyOdd:ymax;
[xOdd, yOdd] = meshgrid(x,y);
fOdd = xOdd.^ 2 + yOdd.^ 2;

%Different numPoints
nxDiff = 100;
nyDiff = 50;

%Construct Functions (for different numPoints)
dxDiff = (xmax - xmin)/(nxDiff-1);
dyDiff = (ymax - ymin)/(nyDiff-1);
x = xmin:dxDiff:xmax;
y = ymin:dyDiff:ymax;
[xDiff, yDiff] = meshgrid(x,y);
fDiff = xDiff.^ 2 + yDiff.^ 2;

%Perform Numerical Integration
%Odd numPoints
%Integrate all rows (ie keeping y constant for each integration)
I_SY = zeros(length(yOdd), 1);
for i = 1:length(yOdd)
    I_SY(i, 1) = numericalIntegration(x, fOdd(i,:), "T")
end
%Final integration over y
I_S = numericalIntegration(y, I_SY, "T")

%Plot
