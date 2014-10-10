%% fn_ode: odes for the fn model
function dy = fn_ode(t, y)
    global  I_ext I_pulse d a b gamma
    dy = zeros(2,1);
    % I_pulse = 0;
    % d = 150;
    if t > 100 && t < 100 + d
        I_p = I_pulse;
    else
        I_p = 0;
    end
    dy(1) = y(1) * (a - y(1)) * (y(1) - 1) - y(2) + I_ext + I_p;
    dy(2) = b * y(1) - gamma * y(2);
end
