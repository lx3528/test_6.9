function [ dy ] = erli( t,y )
%ERLI �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%   y1=y,y2=y��
% y''+k^2*y=0
%global f
%k=f;

dy=[y(2);0.5*cos(y(1))-2*sin(y(1))];

end

