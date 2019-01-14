%System of ODE describing motion
derX1 = @(x1, x2) x2 + x1 * (0.5 - x1 * x1 - x2 * x2);
derX2 = @(x1, x2) -x1 + x2 * (0.5 - x1 * x1 - x2 * x2);

step = 0.0001;

% RK4 solution
% [x1, x2] = RK4(derX1, derX2, step, 0, 0.3);
% plot(x1, x2, 'b')
% title(['Runge-Kutta method with constant step size = ', num2str(step)]);
% xlabel('x1'); ylabel('x2');
% grid on;
% saveas(gcf, "rk4", 'jpg');

% Adams solution
% [x1, x2] = adams5(derX1, derX2, step, 0, 0.3);
% plot(x1, x2, 'b')
% title(['Adams PC (P5EC5E) method with constant step size = ', num2str(step)]);
% xlabel('x1'); ylabel('x2');
% grid on;
% saveas(gcf, "ada", 'jpg');

% ode build-in Matlab function
% hold on;
% [t, y] = ode45(@vdp1, [0 20], [0; 0.3]);
% plot(y(:,1), y(:,2), 'r');
% hold on
% saveas(gcf, "adaode", 'jpg');

% RK4 variable step size
% [x1, x2, errors, steps] = RK4variable(derX1, derX2, 0, 0.3, step, 10^-4, 10^-4);
% plot(x1, x2, 'b');
% title(['RK4 method with variable step size, initial h = ', num2str(step)]);
% xlabel('x1'); ylabel('x2');
% grid on;
% saveas(gcf, "rk4var", 'jpg');
% 
% [n m] = size(x1);
% plot(0:(m-1), x1, 'g')
% title(['RK4 method with variable step size solution versus time']);
% xlabel('t'); ylabel('x1 - green, x2 - red');
% grid on;
% hold on;
% [n m] = size(x2);
% plot(0:(m-1), x2, 'r')
% saveas(gcf, "rk4t", 'jpg');

% [n m] = size(steps);
% plot(0:(m-1), steps, 'm')
% title(['RK4 method with variable step size steps versus time']);
% xlabel('t'); ylabel('step');
% grid on;
% saveas(gcf, "stept", 'jpg');
% 
% [n m] = size(errors);
% plot(0:(n-1), errors(:, 1), 'k')
% title(['RK4 method with variable step size error versus time']);
% xlabel('t'); ylabel('x1 - black, x2 - red');
% grid on;
% hold on;
% plot(0:(n-1), errors(:, 2), 'r')
% saveas(gcf, "rk4err", 'jpg');




