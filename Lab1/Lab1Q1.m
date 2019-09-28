%Init
clear all;
close all;
clc;

%Declarations
x = [0.1 0.2 0.3 0.4 0.5];
k1 = 5;
k2 = 10;
k3 = 20;

%Sums:
%k1 = 5
s5 = 0;
for i = 0:k1
    y = x.^i;
    s5 = s5 + y;
end

%k2 = 10
s10 = 0;
for i = 0:k2
    y = x.^i;
    s10 = s10 + y;
end

%k3 = 20
s20 = 0;
for i = 0:k3
    y = x.^i;
    s20 = s20 + y;
end

%Plot
figure;
plot(x,s5,x,s10,x,s20);
title('Sums');
xlabel('X values');
ylabel('Y values');
legend('Using 5 terms', 'Using 10 terms', 'Using 20 terms');
