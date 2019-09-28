close all
clear all 
clc
format long

%Initialize
x75 = linspace(0, pi, 101); %100 intervals
f75 = sin(x75);
x6000 = linspace(0, pi, 6001); %6000 intervals
f6000 = sin(x6000);

I_T6000 = numericalIntegration(x6000, f6000, "T")
I_S75 = numericalIntegration(x75, f75, "S")
