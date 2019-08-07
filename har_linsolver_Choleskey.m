function x=har_linsolver_Choleskey%(A,b)
%====================================
% ������˹���ֽ�������Է�����
% A����Գ������� A=LL'(�Խ�Ԫ����0)
% ��������
A=[ 4 2 -2 ; 2 2 -3;-2 -3 14];
b=[4 1 0]';
%====================================
n=length(b);
L=zeros(n,n);
%========================�ֽ�=========================
for i=1:n
    %����L�ĵ�i��
    if i==1
        L(i,i)=sqrt(A(i,i));   %��Ԫ
        for j=i+1:n
            L(j,i)=A(j,i)/L(i,i);   %A�Գƣ�����A��i,j����A��j,i��һ��
        end
    else
        L(i,i)= sqrt(A(i,i)-L(i,1:i-1)*L(i,1:i-1)');%��Ԫ,���������Ԫ����Ҫ��
        for j=i+1:n
            L(j,i)=(A(j,i)-L(j,1:i-1)*L(i,1:i-1)')/L(i,i);
        end
    end
end
disp(L);
%========================�ش�========================
%����м�����
y=zeros(n,1);
y(1)=b(1)/L(1,1);
for i=2:n
    y(i)=(b(i)-L(i,1:i-1)*y(1:i-1))/L(i,i);
end
%�������
x=zeros(n,1);
x(n)=y(n)/L(n,n);
for i=n-1:-1:1
    x(i)=(y(i)-L(i+1:n,i)'*x(i+1:n))/L(i,i);
end
end