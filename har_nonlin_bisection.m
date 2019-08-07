function [xfinal,iter]=har_nonlin_bisection%(f,a,b,tol)
%=========================================================
% 二分法
%测试用例
%例：x.^5-3*x-10=0;
%=========================================================
f=@(x) x.^5-3*x-10;
a=1;
b=2;
tol=1e-4;
% iter=0;
% while(1)
%  c=0.5*a+0.5*b;
%  fa=feval(f,a);
%  fb=feval(f,b);
%  fc=feval(f,c); 
%  if(abs(a-b)<tol || abs(fa-fb)<tol )
%      break;
%  end
%   if (sign(fc)==sign(fa))
%       a=c;
%   else
%       b=c;
%   end
%   iter=iter+1;
%   fprintf('%5d:   %9.4f\n',iter,c);    
% end
% xfinal=c;
% end
iter=0;
while(1)
    c=0.5*a+0.5*b;
    fa=feval(f,a);
    fb=feval(f,b);
    fc=feval(f,c);
    if(abs(a-b)<tol || abs(fa-fb)<tol)
        break;
    end
    if(sign(fa)==sign(fc))
        a=c;
    else
        b=c;
    end
    iter=iter+1;
    fprintf('%5d:   %9.4f\n',iter,c);
end
xfinal=c;      %以平均值作为结果
end