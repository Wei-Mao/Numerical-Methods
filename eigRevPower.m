function [minLamda,minMat]=eigRevPower(A,v0,tol)
%=====反幂发求按模最小特征值=============
%by Mao Wei @2017/1/7
%矩阵A具有N个线性无关的特征向量,且严格最小
%测试案例
A=[2 0 0;2 2 1;1 1 2];
v0=[1,1,1]';
tol=1e-4;
[m,I]=max(abs(v0));
lamda0=v0(I);
u0=v0/lamda0;
iter=0;
itermax=100;
while(1)
    v1=A\u0;
    [m1,I1]=max(abs(v1));
    lamda1=v1(I1);
    u0=v1/lamda1;
    err=abs(1/lamda1-1/lamda0);
    iter=iter+1;
    lamda0=lamda1;
    if err<tol
        break;
    end
    
    if iter>itermax
        break;
    end
    lamda=1/lamda1;
    fprintf('iter %d   lamda %5.4f \n',iter,lamda); 
    u0
end
minLamda=lamda;
minMat=u0;
end