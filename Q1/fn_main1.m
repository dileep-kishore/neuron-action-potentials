% Fitzhugh Nagumo model main
clear
clc
global I_ext a b gamma
I_ext = 0.75;
a = 0.5;
b = 0.1;
gamma = 0.1;
time_interval = [0 250];
inital_conditions = [0 0];
[T, solution] = ode45(@fn_ode, time_interval, inital_conditions);
figure(1)
plot(T, solution(:, 1), 'b')
hold on
plot(T, solution(:, 2), 'r')
figure(2)
plot(solution(:,2), solution(:,1))
v = -0.4:0.01:1.5;
w_v = v.*(a-v).*(v-1) + I_ext;
w_omega = b/gamma * v;
figure(3)
plot(v, w_v, 'r')
hold on
plot(v, w_omega, 'b')
