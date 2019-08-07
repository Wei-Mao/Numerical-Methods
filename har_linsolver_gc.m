function x=har_linsolver_gc%(A,b)
%==============================
%列主元高斯消去法
%测试用例
A=[1 13 -2 -34; 2 6 -7 -10; -10 -1 5 9; -3 -5 0 15 ];
b=[13; -22; 14; -36];
%x=[14.3827  30.9062 18.3452   10.7786];
%==============================
% B=[A,b];          %nrow   n+1colums
% n=length(b);
% x=zeros(size(b)); %列向量,为了方便回代
% 
% %消去过程
% for i=1:n-1 %从第一列开始消除，一直到n-1列
%     for j=i+1:n %消除第i列对角元以下元素（j,i）
%         %选主元
%         [~,tab]=max(abs(B(i:n,i))); %选出每一列对角元及下方的元素绝对值最大
%         B([i,tab+i-1],:)=B([tab+i-1,i],:);  %将主元所在行移动到i行,tab是i-1后第几个的意思。
%         
%         %消去第i列j
%         m=-B(j,i)/B(i,i);
%         B(j,i+1:n+1)=B(j,i+1:n+1)+m*B(i,i+1:n+1);
%         B(j,i)=0; %可以删除
%         disp(B);
%     end
% end
% 
% %回代过程
% x(n)=B(n,n+1)/B(n,n);  %回代初值
% for i=n-1:-1:1
%     x(i)=(B(i,n+1)-B(i,i+1:n)*x(i+1:n))/B(i,i);
% end

%V1.1
B=[A,b];
n=length(b);
x=zeros(n,1);
for i=1:n-1
    for j=i+1:n
        %选取列主元
        [~,tab]=max(ab(sB(i:n,i)));
        B([tab+i-1,i],:)=B([i,tab+i-1],:);
        m=-B(j,i)/B(i,i);
        B(j,i+1:n+1)=B(j,i+1:n+1)+m*B(i,i+1:n+1);
        B(j,i)=0;
        disp(B);
    end
end

%回代过程
x(n)=B(n,n+1)/B(n,n); %不能用b,因为已经变化
for k=n-1:-1:1
    x(k)=(B(k,n+1)-B(k,k+1:n)*x(k+1:n))/B(k,k);
end
x
end