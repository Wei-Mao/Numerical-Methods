function [x,y]=odeEvalRegeln%(f,y0,a,b,N)
%Ӧ�øĽ���ŷ����ʽ��Ԥ��У����ʽ����ֵ����
%���԰���
f=@(x,y) y-1./x;
y0=-1;
a=1;
b=2;
N=10; %�����N�ȷ�����N+1����
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