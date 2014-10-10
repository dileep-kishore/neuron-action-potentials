clear
clc
disp('1. Current pulses with I_ext = 0')
disp('2. Determiniing I1 < I_ext < I2')
disp('3. I_ext > I2')
disp('4. Postinhibitory response after negative current pulse')
choice = input('Please choose a file to be run\n');
switch choice
case 1
    fn_main1
case 2
    fn_main2
case 3
    fn_main3
case 4
    fn_main4
end
