x=0:1:3; %默认是行向量
y=[0.2 0 0.5 2.0 1.5 -1];%第一和第二类边界条件，第一个和最后一个分量为条件
pp=csape(x,y,'complete');
[breaks,coefs,npolys,ncoefs,dim]=unmkpp(pp);
xx=linspace(0,3,20);
yy=ppval(pp,xx);
plot(x,y(2:end-1),'r+-');
hold on
plot(xx,yy,'b*-');
