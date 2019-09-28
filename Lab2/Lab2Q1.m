clc 
clear all
close all

%Declare system of eqns
A = [2 -6 -1 ; -3 -1 7; -8 1 -2]

b = [-38 ; -34 ; -20]

%solve system using Gaussian Elimination
[U,d] = fwdElimV2(A,b)

[x] = backSub(U,d)