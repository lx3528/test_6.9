clear;
%lsim û��
%http://blog.sina.com.cn/s/blog_86c2eb8f0102v44n.html
%�ܶຯ�� https://wenku.baidu.com/view/3e23206bddccda38376baf0e.html
num=[1 1];
den=[1 3 6];
%h=tf(num,den);%��ô��ݺ���
[A,B,C,D]=tf2ss(num,den);%�����ݺ���ת��Ϊ״̬����
[u,t]=gensig('pulse',2,10,0.1);%�������Ϊ0.1��ʱ�䳤��Ϊ10����2�ı������źŷ���Ϊ1������ʱ��Ϊ0.
x=u;
sys=ss(A,B,C,D);%ת��--״̬�ռ�Continuous-time state-space model
x0=[0 0];
t=0:0.1:10;%�˴�ʱ��Ϊ�������ʱ����ͬ
[y,x]=lsim(sys,u,t,x0)%ģ�͵������Ӧ������ϵͳ���������뺯������Ӧ
plot(t,y,'b',t,u,'g');