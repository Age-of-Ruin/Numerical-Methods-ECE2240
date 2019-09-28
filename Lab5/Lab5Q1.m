close all
clear all 
clc

%Initialize
x10 = linspace(0, 2*pi, 10);
h10 = x10(2) - x10(1); %equally spaced points
x100 = linspace(0, 2*pi, 100);
h100 = x100(2) - x100(1); %equally spaced points
x1000 = linspace(0, 2*pi, 1000);
h1000 = x1000(2) - x1000(1); %equally spaced points
x10000 = linspace(0, 2*pi, 10000);
h10000 = x10000(2) - x10000(1); %equally spaced points

%Set up Function
f10 = sin(x10);
f100 = sin(x100);
f1000 = sin(x1000);
f10000 = sin(x10000);

%True value
trueResult10 = cos(x10);
trueResult100 = cos(x100);
trueResult1000 = cos(x1000);
trueResult10000 = cos(x10000);

%Approximate evaluations
%n = 10
df_FL10 = numericalDerivative(x10, f10, "FL");
df_BL10 = numericalDerivative(x10, f10, "BL");
df_CL10 = numericalDerivative(x10, f10, "CL");
df_FM10 = numericalDerivative(x10, f10, "FM");
df_BM10 = numericalDerivative(x10, f10, "BM");
df_CM10 = numericalDerivative(x10, f10, "CM");

%n = 100
df_FL100 = numericalDerivative(x100, f100, "FL");
df_BL100 = numericalDerivative(x100, f100, "BL");
df_CL100 = numericalDerivative(x100, f100, "CL");
df_FM100 = numericalDerivative(x100, f100, "FM");
df_BM100 = numericalDerivative(x100, f100, "BM");
df_CM100 = numericalDerivative(x100, f100, "CM");

%n = 1000
df_FL1000 = numericalDerivative(x1000, f1000, "FL");
df_BL1000 = numericalDerivative(x1000, f1000, "BL");
df_CL1000 = numericalDerivative(x1000, f1000, "CL");
df_FM1000 = numericalDerivative(x1000, f1000, "FM");
df_BM1000 = numericalDerivative(x1000, f1000, "BM");
df_CM1000 = numericalDerivative(x1000, f1000, "CM");

%n = 10000
df_FL10000 = numericalDerivative(x10000, f10000, "FL");
df_BL10000 = numericalDerivative(x10000, f10000, "BL");
df_CL10000 = numericalDerivative(x10000, f10000, "CL");
df_FM10000 = numericalDerivative(x10000, f10000, "FM");
df_BM10000 = numericalDerivative(x10000, f10000, "BM");
df_CM10000 = numericalDerivative(x10000, f10000, "CM");

%error (using 2-norm)
%n = 10
error10_FL = norm((h10 * (df_FL10 - trueResult10)), 2)
error10_BL = norm((h10 * (df_BL10 - trueResult10)), 2)
error10_CL = norm((h10 * (df_CL10 - trueResult10)), 2)
error10_FM = norm((h10 * (df_FM10 - trueResult10)), 2)
error10_BM = norm((h10 * (df_BM10 - trueResult10)), 2)
error10_CM = norm((h10 * (df_CM10 - trueResult10)), 2)

%n = 100
error100_FL = norm((h100 * (df_FL100 - trueResult100)), 2)
error100_BL = norm((h100 * (df_BL100 - trueResult100)), 2)
error100_CL = norm((h100 * (df_CL100 - trueResult100)), 2)
error100_FM = norm((h100 * (df_FM100 - trueResult100)), 2)
error100_BM = norm((h100 * (df_BM100 - trueResult100)), 2)
error100_CM = norm((h100 * (df_CM100 - trueResult100)), 2)

%n = 1000
error1000_FL = norm((h1000 * (df_FL1000 - trueResult1000)), 2)
error1000_BL = norm((h1000 * (df_BL1000 - trueResult1000)), 2)
error1000_CL = norm((h1000 * (df_CL1000 - trueResult1000)), 2)
error1000_FM = norm((h1000 * (df_FM1000 - trueResult1000)), 2)
error1000_BM = norm((h1000 * (df_BM1000 - trueResult1000)), 2)
error1000_CM = norm((h1000 * (df_CM1000 - trueResult1000)), 2)

%n = 10000
error10000_FL = norm((h10000 * (df_FL10000 - trueResult10000)), 2)
error10000_BL = norm((h10000 * (df_BL10000 - trueResult10000)), 2)
error10000_CL = norm((h10000 * (df_CL10000 - trueResult10000)), 2)
error10000_FM = norm((h10000 * (df_FM10000 - trueResult10000)), 2)
error10000_BM = norm((h10000 * (df_BM10000 - trueResult10000)), 2)
error10000_CM = norm((h10000 * (df_CM10000 - trueResult10000)), 2)

%Plot 1 - df_CL vs trueResult @ n = 10 and n = 1000
figure(1)
plot(x10, df_CL10)
hold on
plot(x1000, df_CL1000)
hold on
plot(x10, trueResult10)
hold on
plot(x1000, trueResult1000)
title('CL compared to trueResult')
xlabel('X Values')
ylabel('Y Values')
legend('CL @ n = 10', 'CL @ n = 1000', 'trueResult @ n = 10', ...
    'trueResult @ n = 1000')

%Plot 2 - df_FM vs trueResult @ n = 10 and n = 100
figure(2)
plot(x10, df_FM10)
hold on
plot(x100, df_FM100)
hold on
plot(x10, trueResult10)
hold on
plot(x100, trueResult100)
title('FM compared to trueResult')
xlabel('X Values')
ylabel('Y Values')
legend('FM @ n = 10', 'FM @ n = 100', 'trueResult @ n = 10', ...
    'trueResult @ n = 100')