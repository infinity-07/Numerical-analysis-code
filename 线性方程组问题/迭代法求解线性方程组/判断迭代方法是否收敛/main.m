clc,clear,close all
A = [1 2 -2
    1 1 1
    2 2 1];
b = [-15
    20
    -25];

D = diag(diag(A));      % 对角线矩阵 
U = -triu(A,1);         % 上三角矩阵
L = -tril(A,-1);        % 下三角矩阵

B = inv(D)*(L+U);
rho = max(eig(B));

if rho<1
    disp(['该方程的雅克比迭代法的迭代矩阵的谱半径等于 ',num2str(rho),'<1'])
    disp('因此')
    disp('该方程组的雅克比迭代法关于任意初始向量收敛')
else
        disp(['该方程的雅克比迭代法的迭代矩阵的谱半径等于 ',num2str(rho),'>1'])
    disp('因此')
    disp('该方程组的雅克比迭代法不是关于任意初始向量收敛')
end

B = inv(D-L)*U;
rho = max(eig(B));
if rho<1
    disp(['该方程的高斯——赛德尔迭代法的迭代矩阵的谱半径等于 ',num2str(rho),'<1'])
    disp('因此')
    disp('该方程组的高斯——赛德尔迭代法关于任意初始向量收敛')
else
        disp(['该方程的高斯——赛德尔迭代法的迭代矩阵的谱半径等于 ',num2str(rho),'>1'])
    disp('因此')
    disp('该方程组的高斯——赛德尔迭代法不是关于任意初始向量收敛')
end