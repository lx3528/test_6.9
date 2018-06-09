
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
inp=[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,24,26,28];
%% two displacement
%0 point
numl=size(inp,2);rao_displace=zeros(numl,6);disp=1;
for i=1:numl
[rao_displace(i,1),rao_displace(i,2),rao_displace(i,3)] =erjie_weifenfangcheng_func( f5,f6,beta_long(inp(i))-alpha/2,zui_length,disp )
%[rao_displace(i,4),rao_displace(i,5),rao_displace(i,6)] =erjie_weifenfangcheng_func( f11,f12,beta_long(inp(i)),zui_length,disp )
end
%beta_long(inp(1))  s_beta_beta1(1),x_beta1(1),y_beta1(1)
%beta_long(inp(1))-alpha/2 s_beta_beta2(1),x_beta2(1),y_beta2(1)
%1  fin_2
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
    %%%%3 fin_3
    fin_3=[0:0.005:beta_long(inp(j))-alpha/2]';
    point3=size(fin_3,1);
    force_disp3=zeros(point3,2);
    r3_displace=zeros(point3,3);
    force_disp3(:,1)=f11*cos(fin_3-beta_long(inp(j)))+f12*sin(fin_3-beta_long(inp(j)));%%f13
    force_disp3(:,2)=-f11*sin(fin_3-beta_long(inp(j)))+f12*cos(fin_3-beta_long(inp(j)));%%f14
    for i=1:point3%%%%can ����
    [r3_displace(i,1),r3_displace(i,2),r3_displace(i,3)]=erjie_weifenfangcheng_func(force_disp3(i,1),force_disp3(i,2),fin_3(i),zui_length,disp)
    end
    %% transform
    %%%��ԭ����ϵ������
    %{
    %plot(r2_displace(:,2),r2_displace(:,3),'-',r1_displace(:,2),r1_displace(:,3),'x')
    %%����1
    line([r2_displace(1:15,2) r2_displace(2:16,2)],[r2_displace(1:15,3) r2_displace(2:16,3)])
    %%����2
    % for i=1:point2-1
    % line([r2_displace(i,2) r2_displace(i+1,2)],[r2_displace(i,3) r2_displace(i+1,3)])
    % end
    %}
    %%%�任����ϵ
    theta_zhuan2=(pi/2-(beta_long(inp(j))-alpha/2)+fin_2);
    theta_zhuan3=-(pi/2-alpha/2-fin_3+(beta_long(inp(j))));
    xa=rao_displace(j,2);
    ya=rao_displace(j,3);
    %%%
    x_zhuan2=r2_displace(:,2).*cos(theta_zhuan2)+r2_displace(:,3).*sin(theta_zhuan2)-ya;
    y_zhuan2=r2_displace(:,3).*cos(theta_zhuan2)-r2_displace(:,2).*sin(theta_zhuan2)+xa;
    x_zhuan3=r3_displace(:,2).*cos(theta_zhuan3)+r3_displace(:,3).*sin(theta_zhuan3)-ya;
    y_zhuan3=r3_displace(:,3).*cos(theta_zhuan3)-r3_displace(:,2).*sin(theta_zhuan3)+xa;
    plot(x_zhuan2,y_zhuan2)
    hold on;
    plot(x_zhuan3,y_zhuan3)
    hold on;
    %% work for wanwan
    m_ju=f1*rao_displace(j,3)+f2*rao_displace(j,2);
    x_start=-2*ya;
    y_start=2*xa;
    moduan=alpha;
    beta1=[pi/1024:0.01:moduan/2]';
    beta2=[moduan/2:0.01:moduan]';
    index2=size(beta1,1)+1;
    beta=[beta1;beta2];
    num=size(beta,1);
    xpp=zeros(num,1);
    ypp=zeros(num,1);
    [xpp,ypp] =xiaobian_2_func( f1,f2,beta,moduan,m_ju,ei )

    plot(xpp+x_start,ypp+y_start)
    hold on;
    k=tan(pi-alpha/2);
    x_zhuanzhuan=[flipud(x_zhuan2);x_zhuan3];
    y_zhuanzhuan=[flipud(y_zhuan2);y_zhuan3];
    num_zhuan=size(x_zhuanzhuan,1);
    final_disp=zeros(num_zhuan,2);
    xp=xpp(index2)+x_start;
    yp=ypp(index2)+y_start;
    final_disp(:,2)=((k^2-1)*y_zhuanzhuan+2*k*x_zhuanzhuan-2*k*xp+2*yp)/(k^2+1);
    final_disp(:,1)=x_zhuanzhuan-k*(final_disp(:,2)-y_zhuanzhuan)
    plot(final_disp(:,1),final_disp(:,2))   
    hold on
    line([final_disp(end,1),xpp(end)+x_start],[final_disp(end,2),ypp(end)+y_start])
    hold on
    line([x_zhuan3(end),xpp(1)+x_start],[y_zhuan3(end),ypp(1)+y_start])
    hold on
end

% hold on;
%x_zhuan1=r1_displace(:,2).*cos(theta_zhuan1)+r1_displace(:,3).*sin(theta_zhuan1)-ya;
%y_zhuan1=r1_displace(:,3).*cos(theta_zhuan1)-r1_displace(:,2).*sin(theta_zhuan1)+xa;
% plot(x_zhuan1,y_zhuan1)
%% wan qu
%1
%r_wan_disp=zeros(1,3);
%[r_wan_disp(1),r_wan_disp(2),r_wan_disp(3)]=erjie_weifenfangcheng_func_wan(f1,f2,alpha,zui_length,disp)




% %%%�ҶԳ��ᣬ�Գƴ�����
