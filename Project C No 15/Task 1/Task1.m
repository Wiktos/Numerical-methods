x = -5:1:5;
y = [-35.7986 -19.4300 -9.7370 -3.1635 -0.6503 1.5879 1.5176 2.1830 5.1024 11.0910 22.0003];

residuums = [];
for i = 0:10
deg = i;

% plot(x, y, 'bo')
% title(['QR factorization - polynomial degree - ', int2str(deg)]);
% xlabel('x'); ylabel('y');
% grid on;
% hold on;

[a, res] = approxUsingQRdistr(x', y', deg);

residuums = [residuums res];

end

residuums  = residuums';
% plot(x, polynomial_value(x, a), 'r-')
