function x=har_linsolver_Tri%(a,b,c,f)
%=========================================================
% 追赶法，实际上是克拖分解。
% A 为以 a,b,c 为对角线的三对角阵; 
% f 为右端向量
% 测试用例
% 三对角矩阵
  a =  [1 1 1];         %对角线以下元素
  b = [-2 -2 -2 -2];
  c =  [1 1 1];
% 右端向量
  f = [-1 0 0 -1]';
%=========================================================
%==============追赶==================
n=length(b);
l=zeros(n,1);           %为L的主对角线，下一行与A中的相应位置相同
u=zeros(n-1,1);         %为U对角线上面的元素
l(1)=b(1);
u(1)=c(1)/l(1);         %第一行和最后一行均单独算
for i=2:n-1
    l(i)=b(i)-a(i-1)*u(i-1);
    u(i)= c(i)/l(i);
end
l(n)=b(n)-a(n-1)*u(n-1); %单独算
l
u
%=============回代法================
%求中间向量
y=zeros(n,1);
y(1)=f(1)/l(1);
for i=2:n
    y(i)=(f(i)-a(i-1)*y(i-1))/l(i);
end
%求解向量
x=zeros(n,1);
x(n)=y(n);
for i=n-1:-1:1
    x(i)=y(i)-x(i+1)*u(i);
end