function dy = fun1( t,y )
%FUN1 �˴���ʾ�йش˺�����ժҪ
%   y1=y,y2=y��
%   y''=3(1-y^2)*y'-y
dy=[y(2);3*(1-y(1)^2)*y(2)-y(1)];

end

