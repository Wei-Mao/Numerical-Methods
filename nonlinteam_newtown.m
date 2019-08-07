function [x,iter]=nonlinteam_newtown%(f,x0,tol,n)
%测试案例
n=2;
f=@(x) [x(1)+cos(x(2))-1;-sin(x(1))+x(2)-1];
%将向量函数化为符号函数
x1=sym('x',[n 1]);
y=f(x1);
dy=jacobian(y,x1);

%将Jacobi矩阵化为匿名函数
y1=matlabFunction(dy);
end