clear
%8���������17������
x = xlsread('C:\Users\Administrator\Desktop\���ݿ�\machine_learning\xigua3.0-2.xls', 'sheet1', 'A1:Q8');
y = xlsread('C:\Users\Administrator\Desktop\���ݿ�\machine_learning\xigua3.0-2.xls', 'sheet1', 'A9:Q9');

%��������
test=x(:,1);
%������ȡֵ
pn=[3; 3; 3; 3; 3; 2];

pc=0;   %Ϊ���ĸ���  
nc=0;   %Ϊ���ĸ���  
%��6����ɢ��������
for i=1:6
    c=zeros(2,1);
    %�ۻ�����������p��xi|c��
   for j=1:17
       %ȡ��test������ͬ���࣬����  1
       if(x(i,j)==test(i))%test(1)=2,17ge =2 count
           c(y(j)+1)=c(y(j)+1)+1;%y(j)=1 �ù�y(j)=1,huaigua 
       end
   end
   %ȡ�������˱�����
   %pcû���棬�Ҳ������������Ҫ˵��ʲô
   pc=pc+log((c(1)+1)/(9+pn(i)));%%%�ù�8��---Ӧ�û��ϵ�c
   nc=nc+log((c(2)+1)/(8+pn(i)));%%%����9��
end
%��2��������������
p=[1.959,1.203;0.788,0.066];

for i=1:2
   pc=pc+log(p(i,1));
   nc=nc+log(p(i,2));
end