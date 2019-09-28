clc 
clear all
close all

% Generate random square matrices
A1 = rand(100);
A2 = rand(1000);
A3 = rand(2000);
A4 = rand(4000);

condA1 = cond(A1);
condA2 = cond(A2);
condA3 = cond(A3);
condA4 = cond(A4);

% Repeat if condition numbers are too high
while ((condA1 > 1e10) || (condA2 > 1e10) || (condA3 > 1e10) || (condA4 > 1e10))
    A1 = rand(100);
    A2 = rand(1000);
    A3 = rand(2000);
    A4 = rand(4000);
    
    condA1 = cond(A1);
    condA2 = cond(A2);
    condA3 = cond(A3);
    condA4 = cond(A4);
end %end while

% Generate random vector
b1 = rand(100,1);
b2 = rand(1000,1);
b3 = rand(2000,1);
b4 = rand(4000,1);

%Gaussian Elimination
disp('Gaussian Elimination')
%A1
tic
[U,d] = fwdElimV2(A1,b1);
[x] = backSub(U,d);
toc

%A2 
tic
[U,d] = fwdElimV2(A2,b2);
[x] = backSub(U,d);
toc

%A3 
tic
[U,d] = fwdElimV2(A3,b3);
[x] = backSub(U,d);
toc

%A4 
tic
[U,d] = fwdElimV2(A4,b4);
[x] = backSub(U,d);
toc

% LU Factor & Solve
disp('LU Decomp')
%Factor (A1)
tic
[L,U] = LUDecomp(A1);
toc

%Solve
tic
[d] = fwdSub(L,b1); 
[x] = backSub(U,d);
toc

%Factor (A2)
tic
[L,U] = LUDecomp(A2);
toc

%Solve
tic
[d] = fwdSub(L,b2); 
[x] = backSub(U,d);
toc

%Factor (A3)
tic
[L,U] = LUDecomp(A3);
toc

%Solve
tic
[d] = fwdSub(L,b3); 
[x] = backSub(U,d);
toc

%Factor (A4)
tic
[L,U] = LUDecomp(A4);
toc

%Solve
tic
[d] = fwdSub(L,b4); 
[x] = backSub(U,d);
toc

% Inverse
disp('Inverse')
% A1
tic
aInv = matrixInv(A1);
toc
% A2
tic
aInv = matrixInv(A2);
toc

% A3
tic
aInv = matrixInv(A3);
toc

% A4
tic
aInv = matrixInv(A4);
toc