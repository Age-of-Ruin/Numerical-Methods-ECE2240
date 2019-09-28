clc 
clear all
close all

% Declare system of eqns
A = [1 4 9 16 ; 4 9 16 25; 9 16 25 36; 4 25 36 1]

B = [1 4 9 16 ; 4 9 16 25; 9 16 25 36; 16 25 36 49]

C = [1 2 3 4 ; 5 6 7 8; 9 10 11 12; 1 14 15 2]

% condition numbers
condA = cond(A)

condB = cond(B)

condC = cond(C)

% results
aINV = matrixInv(A)

bINV = matrixInv(B)

cINV = matrixInv(C)

% comparing to inv() function
ainv = inv(A)

binv = inv(B)

cinv = inv(C)

% condition numbers
condAInv = cond(aINV); 

condBInv = cond(bINV)

%condCInv = cond(cINV) % cannot calculate due to elements = infinity
disp('Cannot calculate condition number of cINV due to NaN elements')

% Test if functions are working (should equal identity)
Ia = A*aINV

Ib = B*bINV

Ic = C*cINV