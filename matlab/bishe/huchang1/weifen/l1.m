function [ dy ] = l1( t,x )
%L1 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%y''+y'+y=sin(t)
dy=zeros(2,1);
%y=x(1)
%z=x(2)
dy(1)=x(2);
dy(2)=sin(t)-x(2)-x(1);

end
%
