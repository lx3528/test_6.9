function dy = fun3(t,y )
%FUN3 �˴���ʾ�йش˺�����ժҪ
%   y1=y,y2=y��
%   y''=-k^2*y(1)
global f
k=f;
dy=[y(2);-k^2*y(1)*(1+y(2)^2)^(3/2)];



end







