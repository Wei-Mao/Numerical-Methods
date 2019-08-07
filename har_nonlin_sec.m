function [xval,iter]=har_nonlin_sec(f,xinit,tol)
%=========================================================
% 割线法 ( 两点弦截法 ）
% 测试用例
% 例：f=x.^5-3*x-10=0;
% xinit=[1 1.2];
%=========================================================
%f=@(x)x.^5-3*x-10;
f=@(x)(x.^3+x.^2-3*x-3);
xinit=[1.5 1.6];
tol=1e-4;
x0=xinit(1);
x1=xinit(2);
iter=0;
itemax=100;
error=tol+1;
while(error>tol)
    x2=x1-feval(f,x1)*(x1-x0)/(feval(f,x1)-feval(f,x0));
    error=abs(x2-x1);
    x1=x2;
    x0=x1;
    iter=iter+1;
    fprintf('%5d:   %9.4f\n',iter,x1); 
    if(error<tol)
        break;
    end
    if(iter>itemax)
        break;
    end
end
xval=x1;
end