%% fn_ode: odes for the fn model
function dy = fn_ode(t, y)
    global I_ext
    dy = zeros(2,1);
    Amp = 0.5;
	a = 0.5;
	b = 0.1;
    d = 150;
    I_pulse = 0;
    % if t > 50 && t < 50 + d
    %     I_pulse = Amp;
    % else
    %     I_pulse = 0;
    % end
	gamma = 0.1;
	dy(1) = y(1) * (a - y(1)) * (y(1) - 1) - y(2) + I_pulse + I_ext;
	dy(2) = b * y(1) - gamma * y(2);
end
