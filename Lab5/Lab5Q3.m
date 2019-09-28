close all
clear all 
clc
format long

%%%%%%% ROMBERG INTEGRATION %%%%%%%

%Initialize
x1 = linspace(0, pi, 3); %2 intervals
x2 = linspace(0, pi, 5); %4 intervals
x3 = linspace(0, pi, 9); %8 intervals
x4 = linspace(0, pi, 17); %16 intervals
f1 = sin(x1);
f2 = sin(x2);
f3 = sin(x3);
f4 = sin(x4);

%Acquire initial estimates (k = 1) using trapezoidal rule
I_11 = numericalIntegration(x1, f1, "T") % largest step - least accurate (j = 1)
I_21 = numericalIntegration(x2, f2, "T") % j = 2
I_31 = numericalIntegration(x3, f3, "T") % j = 3
I_41 = numericalIntegration(x4, f4, "T") % smallest step - most accurate (j = 4)

%Acquire 2nd level estimates (k = 2)
I_12 = (4^1 * I_21 - I_11)/(4^1 - 1) % Using j = 2 & j = 1 becomes j = 1
I_22 = (4^1 * I_31 - I_21)/(4^1 - 1) % Using j = 3 & j = 2 becomes j = 2
I_32 = (4^1 * I_41 - I_31)/(4^1 - 1) % Using j = 4 & j = 3 becomes j = 3

%Acquire 3rd level estimates (k = 3)
I_13 = (4^2 * I_22 - I_12)/(4^2 - 1) % Using j = 2 & j = 1 becomes j = 1
I_23 = (4^2 * I_32 - I_22)/(4^2 - 1) % Using j = 3 & j = 2 becomes j = 2

%Acquire 4th level estimate (k = 4)
I_14 = (4^3 * I_23 - I_13)/(4^3 - 1) % Using j = 2 & j = 1 becomes j = 1