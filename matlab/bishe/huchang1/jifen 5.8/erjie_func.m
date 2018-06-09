function [ beta,x_length,y_length ] = erjie_func( alpha,f1,ei,s,t )

f2=f1*sin(alpha)/(1+cos(alpha))
f3=f1*cos(alpha/2)+f2*sin(alpha/2)
f4=f1*sin(alpha/2)-f2*cos(alpha/2)

k3=sqrt(f3/ei)
k4=sqrt(f4/ei)
%length_theta=@(theta) D1y-sqrt(2*(k3^2*(cos(y)-cos(beta))-k4^2*sin(y)));
%[theta,fval,exitflag]=fsolve(length_theta,[beta])
%y=dsolve('D1y-sqrt(2*(k3^2*(cos(y)-cos(beta))-k4^2*sin(y)))=0','x(0)=0','y(0)=beta','D1y(0)=0','x')
% 
% x=[0:0.1:100];     %�趨t�ķ�Χ
% plot(x,y);            %���л�ͼ
%{
%%%%fsolve ����
beta=1.09
length_theta=@(theta) 1./sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))));%%%���Ա����йصģ����ӵ�£��ܿ���д������

[theta,fval,exitflag]=fsolve(@(theta) s-quadl(length_theta,0,theta),[beta])
%%-0.1229 fsolve��������֪�����ֽǣ���ôѡ��
%}
%%% ѭ������
%%��Ϊ����alpha/2
dert=0.004
s0=0

%%%0.55 ���������������Ǿֲ����Ž�
while ((s0>s)==0) || (s0>(5*s))
    beta=t
    length_theta=@(theta) 1./sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))));%%%���Ա����йصģ����ӵ�£��ܿ���д������
    s0=quad(length_theta,0,beta);
    while isnan(s0)
        t=t+dert
        beta=t
        length_theta=@(theta) 1./sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))));%
        s0=quad(length_theta,0,t);
    end
    if s0<s
        tel2=s-s0;
        t2=t;
    end
    t=t+dert;
    tel1=s0-s;
    t1=t;
end
x_theta=@(theta) cos(theta)./sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))));
y_theta=@(theta) sin(theta)./sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))));
x_length=quad(x_theta,0,beta)
y_length=quad(y_theta,0,beta)




end

