function x=har_linsolver_Tri%(a,b,c,f)
%=========================================================
% ׷�Ϸ���ʵ�����ǿ��Ϸֽ⡣
% A Ϊ�� a,b,c Ϊ�Խ��ߵ����Խ���; 
% f Ϊ�Ҷ�����
% ��������
% ���ԽǾ���
  a =  [1 1 1];         %�Խ�������Ԫ��
  b = [-2 -2 -2 -2];
  c =  [1 1 1];
% �Ҷ�����
  f = [-1 0 0 -1]';
%=========================================================
%==============׷��==================
n=length(b);
l=zeros(n,1);           %ΪL�����Խ��ߣ���һ����A�е���Ӧλ����ͬ
u=zeros(n-1,1);         %ΪU�Խ��������Ԫ��
l(1)=b(1);
u(1)=c(1)/l(1);         %��һ�к����һ�о�������
for i=2:n-1
    l(i)=b(i)-a(i-1)*u(i-1);
    u(i)= c(i)/l(i);
end
l(n)=b(n)-a(n-1)*u(n-1); %������
l
u
%=============�ش���================
%���м�����
y=zeros(n,1);
y(1)=f(1)/l(1);
for i=2:n
    y(i)=(f(i)-a(i-1)*y(i-1))/l(i);
end
%�������
x=zeros(n,1);
x(n)=y(n);
for i=n-1:-1:1
    x(i)=y(i)-x(i+1)*u(i);
end