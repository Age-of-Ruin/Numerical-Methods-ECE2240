close all
clear all 
clc

%Initialize
x20 = linspace(0, pi, 20);
x100 = linspace(0, pi, 100);

I_P20 = zeros(length(x20), 1);
I_T20 = zeros(length(x20), 1);
I_S20 = zeros(length(x20), 1);

I_P100 = zeros(length(x100), 1);
I_T100 = zeros(length(x100), 1);
I_S100 = zeros(length(x100), 1);


%Set up Function
f20 = sin(x20);
f100 = sin(x100);

%True value
trueResult20 = 1-cos(x20);
trueResult100 = 1-cos(x100);

%Acquire results to plot
for i = 2:length(x20)
    I_P20(i) = numericalIntegration(x20(1:i), f20(1:i), "P");
    I_T20(i) = numericalIntegration(x20(1:i), f20(1:i), "T");
    I_S20(i) = numericalIntegration(x20(1:i), f20(1:i), "S");
end

for i = 2:length(x100)
    I_P100(i) = numericalIntegration(x100(1:i), f100(1:i), "P");
    I_T100(i) = numericalIntegration(x100(1:i), f100(1:i), "T");
    I_S100(i) = numericalIntegration(x100(1:i), f100(1:i), "S");
end

%Print final results
trueVal20 = trueResult20(end)
IP20 = I_P20(end)
IT20 = I_T20(end)
IS20 = I_S20(end)

trueVal100 = trueResult100(end)
IP100 = I_P100(end)
IT100 = I_T100(end)
IS100 = I_S100(end)

%True Percent Relative Error
error20_P = abs((trueResult20(end) - I_P20(end))/trueResult20(end)) * 100
error20_T = abs((trueResult20(end) - I_T20(end))/trueResult20(end)) * 100
error20_S = abs((trueResult20(end) - I_S20(end))/trueResult20(end)) * 100

error100_P = abs((trueResult100(end) - I_P100(end))/trueResult100(end)) * 100
error100_T = abs((trueResult100(end) - I_T100(end))/trueResult100(end)) * 100
error100_S = abs((trueResult100(end) - I_S100(end))/trueResult100(end)) * 100

%Plot
figure(1)
plot(x20, trueResult20)
hold on
plot(x20, I_P20)
hold on
plot(x20, I_S20)
title('Numerical Integration using n = 20')
xlabel('x Values')
ylabel('Y Values')
legend('True Result', 'Pulse Integration', 'Simpsons 1/3 Integration')