clear
clc
global I_ext a b gamma I_pulse d
I_ext = input('Enter I_ext > I2:\n');
a = 0.5;
b = 0.1;
gamma = 0.1;
I_pulse = input('Enter the amplitude of perturbation:\n')
d = input('Enter duration of perturbation:\n')
time_interval = [0 250];
inital_conditions = [0 0];
[T, solution] = ode45(@fn_ode3, time_interval, inital_conditions);
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
