function [xfinal,iter]=har_nonlin_upoint%(fey,x0,tol)
%=========================================================
% ���������
% ��������
% ����x.^5-3*x-10=0;
%�����㷽��Ϊx=(10+3*x).^(1/5)
%iter=inf,��ʾ������
%=========================================================
fey=@(x)(10+3*x).^(1/5);  %��������
x0=1;
tol=1e-4;
iter=0;
fold=feval(fey,x0);
xold=x0;
itemax=100;
while(1)
    x=feval(fey,xold);
    iter=iter+1;
    if(abs(x-xold)<tol)
        break;
    end
    xold=x;
    if(iter>itemax)
        break;
    end
     fprintf('%5d:   %9.4f\n',iter,x); 
    
end
end