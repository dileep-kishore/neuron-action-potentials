% Fitzhugh Nagumo model main
clear
clc
global I_ext a b gamma I_pulse d
% Initializing I_ext = 0
I_ext = 0.0;
% Model parameters
a = 0.5;
b = 0.1;
gamma = 0.1;
% Maximum time of simulation = 250
time_interval = [0 250];
inital_conditions = [0 0];

flag = 0;
% Finding minimum amplitude and duration of I_pulse required for AP
for I_pulse=0:0.01:1
    for d=1:1:50
        [T, solution] = ode45(@fn_ode1, time_interval, inital_conditions);
        % Threshold of 0.5 is assumed to be AP
        if max(solution(:, 1)) > 0.5
            flag = 1;
            break;
        end
    end
    if flag == 1
        break;
    end
end
disp(sprintf('Minimum amplitude of I_pulse required for AP = %.4f', I_pulse))
disp(sprintf('Minimum duration of I_pulse required for AP = %d', d))

I_pulse = input('Enter the amplitude of current pulse:\n');
d = input('Enter the duration of the pulse (<250):\n');
[T, solution] = ode45(@fn_ode1, time_interval, inital_conditions);
figure(1)
plot(T, solution(:, 1), 'b')
hold on
plot(T, solution(:, 2), 'r')
title('v and w vs. time')
legend('v', 'w')
ylabel('v , w')
xlabel('time')
figure(2)
plot(solution(:,1), solution(:,2), 'g')
hold on
v = -0.6:0.01:1.5;
w_v = v.*(a-v).*(v-1) + I_ext;
w_v_pulse = v.*(a-v).*(v-1) + I_ext + I_pulse;
w_omega = b/gamma * v;
plot(v, w_v, 'r')
hold on
plot(v, w_omega, 'b')
hold on
plot(v, w_v_pulse, '-y')
title('Nullclines superimposed on phase plane trajectory')
legend('Phase trajectory', 'v nullcline', 'w nullcline', 'v nullcline(I-pulse)')
xlabel('v')
ylabel('w')
