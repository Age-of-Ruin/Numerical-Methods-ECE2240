clear all
close all
clc

%Initialize Data
x = [0.75 2 3 4 6 8 8.5];
y = [1.2 1.95 2 2.4 2.4 2.7 2.6];

%%%%%%%% Saturation Growth Rate y = Ax/(B + x) -> v = a0 + a1u %%%%%%%%%

%Linearize model 1/y =  1/A + B/A * (1/x) -> v = a0 + a1u
u = 1 ./ x;

v = 1 ./ y;

%Calculate Linear Regression Parameters
[a0_SG, a1_SG, Syx_SG, r_SG] = linearRegression(u, v)

%Alpha a0 = 1/A -> A = 1/a0
A_SG = 1 / a0_SG;

%Beta a1 = B/A -> B = A * a1
B_SG = A_SG * a1_SG;

%SG Model y = Ax/(B + x)
y_SG = (A_SG * x) ./ (B_SG + x);


%%%%%%%% Power Equation y = Ax^B -> v = a0 + a1u %%%%%%%%%

%Linearize model log10(y) = log10(A) + B*log10(x) -> v = a0 + a1u
u = log10(x);

v = log10(y);

%Calculate Linear Regression Parameters
[a0_PE, a1_PE, Syx_PE, r_PE ] = linearRegression(u, v)

%Alpha a0 = log10(A) -> A = 10^a0 
A_PE = 10^a0_PE;

%Beta a1 = B -> B = a1
B_PE = a1_PE;

%PE Model y = Ax^B
y_PE = A_PE * x .^ B_PE;

%Plot
figure(1)
scatter(x,y) %scatter plot
hold on
plot(x, y_SG) %saturation growth model
hold on
plot(x, y_PE) %power equation model
title('Power Model and Saturation Growth Rate Model')
xlabel('X Values')
ylabel('Y Values')
legend('Data', 'SG Model', 'Power Model');