function x=har_linsolver_g%(A,b)
%=============================
%高斯消去法解线性方程
%测试用例
A=[16 -12 2 4; 12 -8 6 10; 3 -13 9 23; -6 14 1 -28];
b=[17; 36; -49 ; -54];
%x=[9.0454;11.4884;-5.9747;5.5211];
%=============================
B=[A,b];
n=length(b);
x=zeros(size(b)); %存储解,列向量

%消去过程
for i=1:n-1
%将第i列消去为0
    for j=i+1:n
        m=-B(j,i)/B(i,i);
        B(j,i+1:n+1)=B(j,i+1:n+1)+m*B(i,i+1:n+1);
        B(j,i)=0;
        disp(B);
    end
end

%回代过程
x(n)=B(n,n+1)/B(n,n);
for i=n-1:-1:1
    x(i)=(B(i,n+1)-B(i,i+1:n)*x(i+1:n))/B(i,i);
end