clear
k=1;
l=0.1;
a=2;
step=70;
theta=0;x=0;w=0;xp=l;
%track
w_track=zeros(1,step);
x_track=zeros(1,step);
theta_track=zeros(1,step);
w_change_track=zeros(1,step);
theta_change_track=zeros(1,step);
for i=1:step
%
w_change=-a/(k^2)*cos(k*x)-1/k*sin(k*x)+x+a/k^2;w_change_track(1,i)=w_change;
theta_change=-a/k*sin(k*x)-cos(k*x)+1;theta_change_track(1,i)=theta_change;
%
x=xp*cos(theta)-w_change*sin(abs(theta))+x;
w=xp*sin(abs(theta))+w_change*cos(theta)+w;
theta=theta_change+theta;
%
x_track(1,i)=x;
w_track(1,i)=w;
theta_track(1,i)=theta;
%pi/4
end
plot(x_track,w_track,'-',x_track,theta_track,'*')
title(['k= ',num2str(k),'ʱ�ӶȺ�ת������������仯'],'Fontsize',15)
legend('λ��','ת��');
xlabel('xλ������')
ylabel('�Ӷ�λ��/m ����/rad')