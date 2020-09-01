function setGlobalKd(val)
global Kd
if val == 0
    Kd = 1000;
elseif val == 1
    Kd = 34;
elseif val ==2
    Kd = 5;
elseif val == 3
    Kd = 1.5;
elseif val == 4
    Kd = 0.4;
else
    disp('Error. Choose a value between 0-4 for setGlobalKd')
end