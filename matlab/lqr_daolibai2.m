%http://blog.csdn.net/heyijia0327/article/details/39270597
clear;
A = [0 1 0 0
     0 0 -1 0
     0 0 0 1
     0 0 9 0];
B = [0;0.1;0;-0.1];
C = [0 0 1 0];   %�۲�Ƕ�
D = 0;

Q = [1 0 0 0
     0 1 0 0
     0 0 10 0
     0 0 0 10
    ];
R = 0.1;
%���������ϵͳ�����Լ����K
K = lqr(A,B,Q,R);
Ac = A - B*K;
%��ϵͳ����ģ��
x0 = [0.1;0;0.1;0]; %��ʼ״̬
t = 0:0.05:20;
u = zeros(size(t));
[y,x]=lsim(Ac,B,C,D,u,t,x0); 
plot(t,y);