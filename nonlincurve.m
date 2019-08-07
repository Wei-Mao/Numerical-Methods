
function main()
[xbest,ymin,flag,output]=fminsearch(@f,[0;0])%@取函数句柄，不能去掉
x=0.1:0.1:0.8;
x=x';
y=[0.6 1.1 1.6 1.8 2.0 1.9 1.7 1.3]';
a=xbest;
xx=linspace(0.1,0.8,40);
yy=a(1)*sin(a(2)*xx);
plot(x,y,'ro',xx,yy)
end
function I=f(a)
x=0.1:0.1:0.8;
x=x';
y=[0.6 1.1 1.6 1.8 2.0 1.9 1.7 1.3]';
I=sum((a(1)*sin(a(2)*x)-y).^2);
end



