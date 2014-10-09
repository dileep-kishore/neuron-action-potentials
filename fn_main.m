% Fitzhugh Nagumo model main
clear
clc
global I_ext a b gamma
% I_ext = 0.5;
a = 0.5;
b = 0.1;
gamma = 0.1;
time_interval = [0 500];
inital_conditions = [0 0];
I1 = 0;
I2 = 0;
for I_ext=1:0.01:5
    [T, solution] = ode45(@fn_ode, time_interval, inital_conditions);
    [peak, location] = findpeaks(solution(:, 1));
    if length(peak) > 1 && I1 == 0
        I1 = I_ext;
    end
    if length(peak) <= 1 && I1 ~= 0
        I2 = I_ext;
        break;
    end
end
I1
I2
