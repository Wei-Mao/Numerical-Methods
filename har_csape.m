x=0:1:3; %Ĭ����������
y=[0.2 0 0.5 2.0 1.5 -1];%��һ�͵ڶ���߽���������һ�������һ������Ϊ����
pp=csape(x,y,'complete');
[breaks,coefs,npolys,ncoefs,dim]=unmkpp(pp);
xx=linspace(0,3,20);
yy=ppval(pp,xx);
plot(x,y(2:end-1),'r+-');
hold on
plot(xx,yy,'b*-');
