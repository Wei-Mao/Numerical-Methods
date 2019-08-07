function x=har_linsolver_Doolittle2%(A,b)
%=========================================================
% �ö����Ѷ��ֽ�������Է�����
% ��������
A=[1 2 3 4; 1 4 9 16; 1 8 27 64; 1 16 81 256 ];
b=[2 10 44 190]';
%=========================================================
n=length(b);

%=======================�ֽ�==============================
for i=1:n
  %����U�ĵ�i�У�ע���һ����Ҫ�������
  if i==1
    A(i,:) = A(i,:);
  else
      for j=i:n
          A(i,j) = A(i,j)-A(i,1:i-1)*A(1:i-1,j); 
      end
  end
  
  %����L�ĵ�i��
  for j=i+1:n
      A(j,i) = (A(j,i)-A(j,1:i-1)*A(1:i-1,i))/A(i,i);
  end  
end
disp(A)


%=======================�ش�==============================
%�м�����
y=zeros(n,1);
y(1)=b(1);
for i=2:n
    y(i) = b(i)-A(i,1:i-1)*y(1:i-1);%��Ϊ�ǵ�λ�����ǣ����Բ��ó���ϵ��
end

%�������
x=zeros(n,1);
x(n)=y(n)/A(n,n);
for i=n-1:-1:1
    x(i)=(y(i)-A(i,i+1:n)*x(i+1:n))/A(i,i);
end
end