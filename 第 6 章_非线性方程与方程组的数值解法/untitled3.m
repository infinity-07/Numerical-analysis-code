clc, clear, close all

% 比较各种非线性方程求根方法的效果
% 测试函数
f = @(x) sin(x) - x/2 + 2;
df = @(x) cos(x) - 1/2;
fname = 'f(x) = sin(x) - x/2 + 2';

% 设置参数
tolerance = 1e-6;
maxIterations = 100;

% 输出表头
fprintf('\n非线性方程求根方法比较\n');
fprintf('----------------------------------------\n');
fprintf('\n测试函数: %s\n', fname);
fprintf('----------------------------------------\n');
fprintf('方法\t\t根\t\t迭代次数\t收敛性\n');
fprintf('----------------------------------------\n');

% 牛顿法
[rootN, convN, iterN] = newtonMethod(f, df, 1, tolerance, maxIterations);
fprintf('牛顿法\t\t%.6f\t%d\t\t%s\n', rootN, iterN, string(convN));

% 割线法
[rootS, convS, iterS] = secantMethod(f, 0, 1, tolerance, maxIterations);
fprintf('割线法\t\t%.6f\t%d\t\t%s\n', rootS, iterS, string(convS));

% 二分法
[rootD, convD, iterD] = dichotomyMethod(f, 0, 5, tolerance, maxIterations);
fprintf('二分法\t\t%.6f\t%d\t\t%s\n', rootD, iterD, string(convD));

% 抛物线插值法
[rootP, convP, iterP] = parabolicMethod(f, 0, 1, 2, tolerance, maxIterations);
fprintf('抛物线插值法\t%.6f\t%d\t\t%s\n', rootP, iterP, string(convP));

% 验证结果
fprintf('\n各方法误差比较:\n');
fprintf('牛顿法误差: %.2e\n', abs(f(rootN)));
fprintf('割线法误差: %.2e\n', abs(f(rootS)));
fprintf('二分法误差: %.2e\n', abs(f(rootD)));
fprintf('抛物线插值法误差: %.2e\n', abs(f(rootP)));
fprintf('----------------------------------------\n');