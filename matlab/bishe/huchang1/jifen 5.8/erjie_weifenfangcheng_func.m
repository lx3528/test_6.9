function [s_final,x_length,y_length] = erjie_weifenfangcheng_func( alpha,f1_ei,beta,zui_length,disp )
%�����²�Ҫд����

f2=f1_ei*sin(alpha)/(1+cos(alpha))
f3=f1_ei*cos(alpha/2)+f2*sin(alpha/2)
f4=f1_ei*sin(alpha/2)-f2*cos(alpha/2)
global k3
global k4
k3=sqrt(f3)
k4=sqrt(f4)
%zui_length=20
options=odeset('events',@events_weifen);
[s,theta,TE,YE,IE]=ode45(@mupli,[0 zui_length],[beta  0 ],options)%%%%theta=0 s=1.58
%%te��value�Ľ�ֹ��ֵ����֪����y=0,��õ�s=0.48
%% you know
%%ye�ǽ�ֹʱ�̵�y��0��-3.66
%%ie��0���ǽ������
%plot(s,theta(:,1))
s_final=TE
x_length=0;
y_length=0;
eps=0.000001
if disp
    x_theta=@(theta) cos(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
    y_theta=@(theta) sin(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
    x_length=quad(x_theta,0,beta)
    y_length=quad(y_theta,0,beta)
end
end