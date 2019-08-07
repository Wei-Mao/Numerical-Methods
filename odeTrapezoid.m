function [x,y]=odeTrapezoid(f,y0,a,b,N)
%�����ι�˾���һԪ��ֵ����
%���԰���
%y'=y-2x/y,y(0)=1;x-[0,1]
f=@(x,y) y-2*x./y;
y0=1;
a=0;
b=1;
N=10;%11����
h=(b-a)/N;
x=a:h:b;
y(1)=y0;
fprintf('%f %f\n',a,y0);
for i=1:N
    yold=y(i);
    tol=1e-5;
    %�ò��������������y(i+1),��Ҫ�����ж��Ƿ�����ѹ��ӳ��ԭ��
%     while(1)
%         ynew=y(i)+0.5*h*(feval(f,x(i),y(i))+feval(f,x(i+1),yold));
%         err=abs(ynew-yold);
%         yold=ynew;
%         if err<tol
%             y(i+1)=ynew;
%             break;
%         end
%     end
    %����ţ�ٷ�����y(i+1),ֻҪ�㹻�⻬��������
    fnewtown=@(yn1) y(i)+0.5*h*(feval(f,x(i),y(i))+feval(f,x(i+1),yn1))-yn1;
   [y(i+1),~]= har_nonlin_newtown1(fnewtown,yold,tol);%��ţ�ٷ������󵼺���
    fprintf('%f %f\n',x(i+1),y(i+1));  %������
end
end