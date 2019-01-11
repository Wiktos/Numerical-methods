%System of ODE describing motion
derX1 = @(x1, x2) x2 + x1 * (0.5 - x1 * x1 - x2 * x2);
derX2 = @(x1, x2) -x1 + x2 * (0.5 - x1 * x1 - x2 * x2);

step = 0.0005;

% RK4 solution
% [x1, x2] = RK4(derX1, derX2, step, 0, 0.3);
% plot(x1, x2, 'b')
% title(['Runge-Kutta method with constant step size = ', num2str(step), ' compared with ode45 function']);
% xlabel('x1'); ylabel('x2');
% grid on;
% hold on;

% Adams solution
% [x1, x2] = adams5(derX1, derX2, step, 0, 0.3);
% plot(x1, x2, 'b')
% title(['Adams PC (P5EC5E) method with constant step size = ', num2str(step), ' compared with ode45 function']);
% xlabel('x1'); ylabel('x2');
% grid on;
% hold on;

% ode build-in Matlab function
% [t, y] = ode45(@vdp1, [0 20], [0; 0.3]);
% plot(y(:,1), y(:,2), 'r');
% hold on

% RK4 variable step size
% [x1, x2] = RK4variable(derX1, derX2, 0, 0.3, 0.0005, 10^-20, 10^-40);
% plot(x1, x2, 'b');
% title(['RK4 method with variable step size, initial h = ', num2str(step), ' compared with ode45']);
% xlabel('x1'); ylabel('x2');
% grid on;



