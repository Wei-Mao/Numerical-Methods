function [x,iter]=nonlinteam_newtown%(f,x0,tol,n)
%���԰���
n=2;
f=@(x) [x(1)+cos(x(2))-1;-sin(x(1))+x(2)-1];
%������������Ϊ���ź���
x1=sym('x',[n 1]);
y=f(x1);
dy=jacobian(y,x1);

%��Jacobi����Ϊ��������
y1=matlabFunction(dy);
end