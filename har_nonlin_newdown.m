function [xfinal,iter]=har_nonlin_newdown%(f,g,x0,tol)
%=========================================================
% ţ����ɽ��
% ��������
% ����f=x.^5-3*x-10=0;
%g=5*x.^4-3x-10;ע�����ձȽϺ����ľ���ֵ
f=@(x) x.^5-3*x-10;
g=@(x) 5*x.^4-3;
x0=1.2;
tol=1e-5;
iter=0;
xold=x0;
itemax=40;
while(1)
    fold=feval(f,xold);
    fold1=feval(g,xold);
    d=-fold/fold1;
    lamda=1;
    while(1)
        xnew=xold+lamda*d;
        fnew=feval(f,xnew);
        if(abs(fnew)<abs(fold))
            break;
        end
        lamda=0.5*lamda;
        iter=iter+1;
        if iter>itemax
            break;
            fprintf('failure\n');
        end
    end
    err=abs(xnew-xold);
    xold=xnew;
    if(err<tol)
        break;
    end
    fprintf('%f\n',xold);
    
end