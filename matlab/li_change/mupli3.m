function [ dtheta ] = mupli3( s,theta )
%L1 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
dtheta=zeros(2,1);
global kp
dtheta(1)=theta(2);
dtheta(2)=-kp^2*sin(theta(1))


end
