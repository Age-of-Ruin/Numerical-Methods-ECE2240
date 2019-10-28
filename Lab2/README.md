# LU Decomposition and Matrix Inversion
## Part 1
Part 1 of the this lab implements forward elimination (fwdElim.m) and backwards substituion (backSub.m) to solve systems of equations.

## Part 2
Part 2 implements LU Matrix decompostion in order to calculate the inverse of a matrix. This is accomplished breaking a system of equations (Ax = b) into LUx = b (where A = LU U is an upper triangular matrix and L is a lower triangular matrix). The program fwdSub.m takes L and b to produce d (where Ld = b). The program backSub.m then solves for x using Ux = d. Then, utilizing the solution where b = I (identity matrix), x can be solved to produce the inverted matrix.