function [ dtheta ] = mupli2( s,theta )
%L1 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
dtheta=zeros(2,1);
%y=x(1)
%z=x(2)
global k3;
global k4;
dtheta(1)=theta(2);
dtheta(2)=k4^2*cos(theta(1))-k3^2*sin(theta(1))

end

    
