function [x,y]=odeTrapezoid(f,y0,a,b,N)
%用梯形公司求解一元初值问题
%测试案例
%y'=y-2x/y,y(0)=1;x-[0,1]
f=@(x,y) y-2*x./y;
y0=1;
a=0;
b=1;
N=10;%11个点
h=(b-a)/N;
x=a:h:b;
y(1)=y0;
fprintf('%f %f\n',a,y0);
for i=1:N
    yold=y(i);
    tol=1e-5;
    %用不动点迭代法计算y(i+1),需要事先判断是否满足压缩映像原理
%     while(1)
%         ynew=y(i)+0.5*h*(feval(f,x(i),y(i))+feval(f,x(i+1),yold));
%         err=abs(ynew-yold);
%         yold=ynew;
%         if err<tol
%             y(i+1)=ynew;
%             break;
%         end
%     end
    %采用牛顿法计算y(i+1),只要足够光滑即可收敛
    fnewtown=@(yn1) y(i)+0.5*h*(feval(f,x(i),y(i))+feval(f,x(i+1),yn1))-yn1;
   [y(i+1),~]= har_nonlin_newtown1(fnewtown,yold,tol);%该牛顿法不用求导函数
    fprintf('%f %f\n',x(i+1),y(i+1));  %测试用
end
end