function [x,iter]=har_SOR(A,b,tol,omega)
%============================
%²âÊÔ°¸Àý SORµü´ú
% A=[20 4 6;4 20 8;6 8 20];
% b=[10 -24 -22]';
% tol=0.5e-4;
% omega=1.35;
%============================
D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);
x=zeros(size(b));
iter=0;
while (1)
    temp=x;
    x=(D-omega*L)\(((1-omega)*D+omega*U)*x+omega*b);
    error=max(abs(x-temp));
    iter=iter+1;
    if (error<=tol)
        break;
    end
    if(iter>100)
        iter=inf;
        break;
    end
        
end
end