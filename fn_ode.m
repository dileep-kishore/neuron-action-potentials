%% fn_ode: odes for the fn model
function dy = fn_ode(t, y)
    global I_ext
    dy = zeros(2,1);
	a = 0.5;
	b = 0.1;
    % if t > 100 && t < 100
    %     I_ext = 0.5;
    % else
    %     I_ext = 0;
    % end
	gamma = 0.1;
	dy(1) = y(1) * (a - y(1)) * (y(1) - 1) - y(2) + I_ext;
	dy(2) = b * y(1) - gamma * y(2);
end