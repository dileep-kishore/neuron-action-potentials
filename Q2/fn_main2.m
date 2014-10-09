% Fitzhugh Nagumo model main
clear
clc
global I_ext a b gamma
% I_ext = 0.5;
a = 0.5;
b = 0.1;
gamma = 0.1;
time_interval = [0 250];
inital_conditions = [0 0];
I1 = 0;
I2 = 0;
thres = 0.5;
for I_ext=0:0.01:3
    [T, solution] = ode45(@fn_ode, time_interval, inital_conditions);
    if max(solution(:, 1)) < 0.3
        pks = [];
    else
        [pks, l] = findpeaks(solution(:, 1), 'MINPEAKHEIGHT', 0.3);
        pks = sort(pks, 2, 'descend');
    end
    if length(pks) > 1 && I1 == 0 && pks(2) > thres
        pks
        I1 = I_ext;
        continue;
    end
    if length(pks) > 2  && pks(2) < 1 && solution(round((l(2)+l(3))/2))<pks(3)-0.05 && I1 ~= 0
        pks
        I2 = I_ext;
        % break;
    end
end
I1
I2
