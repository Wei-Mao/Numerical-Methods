function [x,y]=odeEvalRegeln%(f,y0,a,b,N)
%应用改进的欧拉公式即预估校正公式求解初值问题
%测试案例
f=@(x,y) y-1./x;
y0=-1;
a=1;
b=2;
N=10; %区间分N等分则有N+1个点
h=(b-a)/N;
x=a:h:b;
y(1)=y0;
for i=1:N
    yp = y(i)+h*feval(f,x(i),y(i));
    yc = y(i)+h*feval(f,x(i+1),yp);
    y(i+1) = 0.5*(yp+yc);
    fprintf('x %f   y %f \n',x(i+1),y(i+1));
end

end