function [x,iter]=har_nonlin_newtown1(f,x0,tol)
%本例用牛顿法求解非线性方程,且不用用户求导函数
% %测试案例
% f=@(x) x.^5-3*x-10;
% x0=1.2;
% tol=1e-5;
iter=0;
xold=x0;
itemax=100;
%匿名函数转符号函数
syms x1
y=f(x1);
y1=diff(y);

%将符号导函数转成匿名函数
f1= matlabFunction(y1);
while(1)
    xnew=xold-feval(f,xold)/feval(f1,xold);
    err=abs(xnew-xold);
    %err=abs(feval(f,xnew));
    iter=iter+1;
     fprintf('%d %f\n',iter,xnew);
    if err<tol
        break;
    end
    xold=xnew;
end
x=xnew;