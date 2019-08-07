function [x,V]=eigIPower%(A,v0,tol)
%========���ݷ���ģ�������ֵ======%
%by Mao Wei @2017/1/7
%���������N����ͬ�������������Ұ�ģ�������ֵ�ϸ����
%���԰���
%A=[1 3 3;2 1 3; 3 3 6;];ʵ�Գƾ���һ�����ԶԽǻ�������n�������޹ص�����������
A=[12 6 -6;6 16 2;-6 2 16];
%v0=[1 1 1]';
v0=[1 0.5 -0.5]';
tol=1e-5;
[~,ind]=max(abs(v0));%ע���ǰ�ģȡ���ֵ
lamda0=v0(ind);
u0=v0/lamda0;
flag=0;
itermax=100;%��ֹ�������޷��˳�ѭ��
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
%����ΪV1.0
% % while(flag==0 && iter<itermax)
%     %����vֵ
%     v1=A*u0;
%     [m1,ind1]=max(abs(v1));
%     
%     %��������ֵ
%     lamda1=v1(ind1);
%     
%     %�淶��v1������u0ֵ
%     u0=v1/lamda1;
%     
%     %�������
%     err=abs(lamda0-lamda1);
%    
%     %ֹͣ��������
%     if(err<tol)
%         flag=1;
%     end
%     %����lamda0
%     lamda0=lamda1;
%     iter=iter+1;
%      %���ÿһ�����
%     fprintf('iter %d   lamda %5.4f \n',iter,lamda0);
% end
x=u0;
V=lamda0;
end