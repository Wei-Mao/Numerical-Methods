function [x,V]=eigIPower%(A,v0,tol)
%========乘幂法求按模最大特征值======%
%by Mao Wei @2017/1/7
%矩阵必须又N个不同的特征向量，且按模最大特征值严格最大
%测试案例
%A=[1 3 3;2 1 3; 3 3 6;];实对称矩阵一定可以对角化（具有n个线性无关的特征向量）
A=[12 6 -6;6 16 2;-6 2 16];
%v0=[1 1 1]';
v0=[1 0.5 -0.5]';
tol=1e-5;
[~,ind]=max(abs(v0));%注意是按模取最大值
lamda0=v0(ind);
u0=v0/lamda0;
flag=0;
itermax=100;%防止不收敛无法退出循环
iter=0;
%V1.1
while(1)
    
    v1=A*u0;
    [~,ti]=max(abs(v1));
    lamda1=v1(ti);
    u0=v1/lamda1;
    err=abs(lamda1-lamda0);
    
    if err<tol
        break;
    end
    lamda0=lamda1;
    iter=iter+1;
    fprintf('iter %d   lamda %5.4f \n',iter,lamda0);
    if iter>itermax
        break;
    end
end
%以下为V1.0
% % while(flag==0 && iter<itermax)
%     %更新v值
%     v1=A*u0;
%     [m1,ind1]=max(abs(v1));
%     
%     %计算特征值
%     lamda1=v1(ind1);
%     
%     %规范化v1，更新u0值
%     u0=v1/lamda1;
%     
%     %计算误差
%     err=abs(lamda0-lamda1);
%    
%     %停止迭代条件
%     if(err<tol)
%         flag=1;
%     end
%     %跟新lamda0
%     lamda0=lamda1;
%     iter=iter+1;
%      %输出每一代结果
%     fprintf('iter %d   lamda %5.4f \n',iter,lamda0);
% end
x=u0;
V=lamda0;
end