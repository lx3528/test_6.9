clear
%8个特征类别，17个数据
x = xlsread('C:\Users\Administrator\Desktop\数据库\machine_learning\xigua3.0-2.xls', 'sheet1', 'A1:Q8');
y = xlsread('C:\Users\Administrator\Desktop\数据库\machine_learning\xigua3.0-2.xls', 'sheet1', 'A9:Q9');

%测试用例
test=x(:,1);
%各参数取值
pn=[3; 3; 3; 3; 3; 2];

pc=0;   %为正的概率  
nc=0;   %为正的概率  
%对6种离散参数遍历
for i=1:6
    c=zeros(2,1);
    %累积次数，计算p（xi|c）
   for j=1:17
       %取和test属性相同的类，计算  1
       if(x(i,j)==test(i))%test(1)=2,17ge =2 count
           c(y(j)+1)=c(y(j)+1)+1;%y(j)=1 好瓜y(j)=1,huaigua 
       end
   end
   %取对数连乘变连加
   %pc没保存，我不懂这个代码是要说明什么
   pc=pc+log((c(1)+1)/(9+pn(i)));%%%好瓜8个---应该坏瓜的c
   nc=nc+log((c(2)+1)/(8+pn(i)));%%%坏瓜9个
end
%对2种连续参数遍历
p=[1.959,1.203;0.788,0.066];

for i=1:2
   pc=pc+log(p(i,1));
   nc=nc+log(p(i,2));
end