clear
clc
global I_ext a b gamma I_pulse d
I_ext = 0.0;
I_pulse = input('Enter the amplitude of the negative current pulse:\n');
d = input('Enter the duration of the pulse (<250):\n');
a = 0.5;
b = 0.1;
gamma = 0.1;
time_interval = [0 250];
inital_conditions = [0 0];
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
w_omega = b/gamma * v;
plot(v, w_v, 'r')
hold on
plot(v, w_omega, 'b')
title('Nullclines superimposed on phase plane trajectory')
legend('Phase diagram', 'v nullcline', 'w nullcline')
xlabel('v')
ylabel('w')
