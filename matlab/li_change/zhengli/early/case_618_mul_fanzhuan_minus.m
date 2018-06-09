%%%���618 mul ��ת������ ����Ƕ�׺�������ʽ������ֱ�ӵ���ʽ
clear all;clc
alpha=pi/2;ei=1;f1=1;f1_ei=f1/ei;disp=1
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f3=f1_ei*cos(alpha/2)+f2*sin(alpha/2);
f4=f1_ei*sin(alpha/2)-f2*cos(alpha/2);
f5=f1_ei;f6=-f2;f9=f5;f10=f6;
f11=f9*cos(alpha/2)+f10*sin(alpha/2);
f12=-f9*sin(alpha/2)+f10*cos(alpha/2);
%% find huchang
t=0.1;index=50;zui_length=20;beta_long=linspace(alpha/2+0.00001,pi/2,index)';
inp=[5,6];
%% two displacement
%0 point
numr=size(inp,2);rao_displace=zeros(numr,6);disp=1;
for i=1:numr
[rao_displace(i,1),rao_displace(i,2),rao_displace(i,3)] =erjie_weifenfangcheng_func( f5,f6,beta_long(inp(i))-alpha/2,zui_length,disp )
end

for j=1:size(inp,2)
    fin_2=[0:0.005:beta_long(inp(j))-alpha/2]';
    point2=size(fin_2,1);
    force_disp2=zeros(point2,2);
    r2_displace=zeros(point2,3);
    force_disp2(:,1)=f5*cos(beta_long(inp(j))-alpha/2-fin_2)+f6*sin(beta_long(inp(j))-alpha/2-fin_2);%%f7
    force_disp2(:,2)=-f5*sin(beta_long(inp(j))-alpha/2-fin_2)+f6*cos(beta_long(inp(j))-alpha/2-fin_2);%%f8
    for i=1:point2%%%%can ����
    [r2_displace(i,1),r2_displace(i,2),r2_displace(i,3)]=erjie_weifenfangcheng_func(force_disp2(i,1),force_disp2(i,2),fin_2(i),zui_length,disp)
    end
    %plot(r2_displace(:,2),r2_displace(:,3))

    %% transform
    theta_zhuan2=(pi/2-(beta_long(inp(j))-alpha/2)+fin_2);
    xa=rao_displace(j,2);
    ya=rao_displace(j,3);
    %%%
    x_zhuan2_zhong=r2_displace(:,2).*cos(theta_zhuan2)+r2_displace(:,3).*sin(theta_zhuan2);
    y_zhuan2_zhong=r2_displace(:,3).*cos(theta_zhuan2)-r2_displace(:,2).*sin(theta_zhuan2);
    %%%
    x_zhuan2=x_zhuan2_zhong-ya;
    y_zhuan2=y_zhuan2_zhong+xa;
    x_zhuan3=-x_zhuan2_zhong-ya;
    y_zhuan3=-y_zhuan2_zhong+xa;
    plot(x_zhuan2,y_zhuan2)
    hold on;
    plot(x_zhuan3,y_zhuan3)
    hold on;
    m_ju=f1*rao_displace(j,3)+f2*rao_displace(j,2);
    x_start=-2*ya;
    y_start=2*xa;
    moduan=alpha;
    beta1=[pi/1024:0.01:moduan/2]';
    beta2=[moduan/2:0.01:moduan]';
    index2=size(beta1,1)+1;
    beta=[beta1;beta2];
    num=size(beta,1);
%     xpp=zeros(num,1);
%     ypp=zeros(num,1);
    
    f17=f1;f18=f2;
    f19=f17*cos(moduan-beta)+f18*sin(moduan-beta);
    f20=-f17*sin(moduan-beta)+f18*cos(moduan-beta);
    zhili_displace=zeros(num,3);disp=1;zui_length=20;yijiedao=-m_ju/ei;
    
    for i=1:num
    [zhili_displace(i,1),zhili_displace(i,2),zhili_displace(i,3)] =zhili_weifenfangcheng_func( f19(i),f20(i),beta(i),yijiedao,zui_length,disp)
    end
    xpp=zhili_displace(:,2).*cos(moduan-beta)-zhili_displace(:,3).*sin(moduan-beta);
    ypp=zhili_displace(:,2).*sin(moduan-beta)+zhili_displace(:,3).*cos(moduan-beta);

    plot(xpp+x_start,ypp+y_start)
    hold on;
    x_zhuanzhuan=[flipud(x_zhuan2);x_zhuan3];
    y_zhuanzhuan=[flipud(y_zhuan2);y_zhuan3];
    num_zhuan=size(x_zhuanzhuan,1);
    final_disp=zeros(num_zhuan,2);
    xp=xpp(index2)+x_start;
    yp=ypp(index2)+y_start;
    k=tan(pi-alpha/2);
    final_disp(:,2)=((k^2-1)*y_zhuanzhuan+2*k*x_zhuanzhuan-2*k*xp+2*yp)/(k^2+1);
    final_disp(:,1)=x_zhuanzhuan-k*(final_disp(:,2)-y_zhuanzhuan)
    plot(final_disp(:,1),final_disp(:,2))   
    hold on
    line([final_disp(end,1),xpp(end)+x_start],[final_disp(end,2),ypp(end)+y_start])
    hold on
    line([x_zhuan3(end),xpp(1)+x_start],[y_zhuan3(end),ypp(1)+y_start])
    hold on 
	der_x1=x_zhuanzhuan(1);der_y1=y_zhuanzhuan(1);der_x2=final_disp(1,1);der_y2=final_disp(1,2);
    der_a=der_y2-der_y1;
    der_b=-(der_x2-der_x1);
    der_c=der_y1*(der_x2-der_x1)-der_x1*(der_y2-der_y1);
    d=abs((der_a*xp+der_b*yp+der_c)/sqrt(der_a^2+der_b^2))
end