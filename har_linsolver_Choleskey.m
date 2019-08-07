function x=har_linsolver_Choleskey%(A,b)
%====================================
% 用乔列斯基分解求解线性方程组
% A必须对称正定则 A=LL'(对角元大于0)
% 测试用例
A=[ 4 2 -2 ; 2 2 -3;-2 -3 14];
b=[4 1 0]';
%====================================
n=length(b);
L=zeros(n,n);
%========================分解=========================
for i=1:n
    %计算L的第i列
    if i==1
        L(i,i)=sqrt(A(i,i));   %主元
        for j=i+1:n
            L(j,i)=A(j,i)/L(i,i);   %A对称，所以A（i,j）和A（j,i）一致
        end
    else
        L(i,i)= sqrt(A(i,i)-L(i,1:i-1)*L(i,1:i-1)');%主元,求该列其他元素需要用
        for j=i+1:n
            L(j,i)=(A(j,i)-L(j,1:i-1)*L(i,1:i-1)')/L(i,i);
        end
    end
end
disp(L);
%========================回代========================
%求解中间向量
y=zeros(n,1);
y(1)=b(1)/L(1,1);
for i=2:n
    y(i)=(b(i)-L(i,1:i-1)*y(1:i-1))/L(i,i);
end
%求解向量
x=zeros(n,1);
x(n)=y(n)/L(n,n);
for i=n-1:-1:1
    x(i)=(y(i)-L(i+1:n,i)'*x(i+1:n))/L(i,i);
end
end