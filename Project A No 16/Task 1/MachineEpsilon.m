%The script determines the machine epsilon

macheps = 1.0;

%Computing the machine epsilon based on the unit round definition
while 1.0 + macheps > 1.0
    macheps = macheps / 2;
end

%We must multiply times 2 to get last 'visible' in addition value
macheps = macheps * 2;

disp(['The machine epsilon = ', num2str(macheps, 50)])

clear