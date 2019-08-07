function [xfinal,iter]=har_nonlinsolver_n%(f,g,x0,tol)
%=========================================================
%ţ�ٷ�
% ��������
% ����f=x.^5-3*x-10=0;
%g=5*x.^4-3;
%iter=inf,��ʾ������
%=========================================================
f=@(x) x.^5-3*x-10;
g=@(x) 5*x.^4-3;
x0=1;
tol=1e-4;

iter=0;
x=x0;
itemax=100;
while(1)
    fold=feval(f,x);
    xold=x;
    x=x-feval(f,x)/feval(g,x);
    if(abs(x-xold)<tol)
        break;
    end
   iter=iter+1;
    if(iter>itemax)
        break;
    end
     fprintf('%5d:   %9.4f\n',iter,x); 
    
end
end