function [x,iter]=har_GS(A,b,tol)
%============================
% %测试案例 高斯塞德尔迭代
% A=[20 4 6;4 20 8;6 8 20];
% b=[10 -24 -22]';
% tol=0.5e-4;
%============================
D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);
x=zeros(size(b));
iter=0;
while (1)
    temp=x;
    x=(D-L)\(U*x+b);
    error=max(abs(x-temp));
    iter=iter+1;
    if (error<=tol)
        break;
    end
end
end