function [x,iter]=har_nonlin_newtown1(f,x0,tol)
%������ţ�ٷ��������Է���,�Ҳ����û��󵼺���
% %���԰���
% f=@(x) x.^5-3*x-10;
% x0=1.2;
% tol=1e-5;
iter=0;
xold=x0;
itemax=100;
%��������ת���ź���
syms x1
y=f(x1);
y1=diff(y);

%�����ŵ�����ת����������
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