
%���� https://wenku.baidu.com/view/8afb62f3284ac850ad02428b.html
clear;         
A=[ 0 1 0 0; 0 0 0 0;    0 0 0 1;   0 0 29.4 0];      
B=[ 0 1 0 3]';  
C=[ 1 0 0 0;    0 0 1 0];  
D=[ 0 0 ]';    
Q11=5000; 
Q33=100;          
Q=[Q11 0 0 0;      0 0 0 0;   0 0 Q33 0;0 0 0 0];   
R = 1;         
K = lqr(A,B,Q,R)                       %��K      
Ac = [(A-B*K)];
Bc = [B]; 
Cc = [C];
Dc = [D];        
T=0:0.005:5;         
U=ones(size(T));                        %���뵥λ����    
[Y,X]=lsim(Ac,Bc,Cc,Dc,U,T);            %�����Ӧ     
plot(T,X(:,1),':');hold on;       
plot(T,X(:,2),'-.');hold on;         
plot(T,X(:,3),'.');hold on;        
plot(T,X(:,4),'-')         
legend('С��λ��','С���ٶ�','�ڸ˽Ƕ�','�ڸ˽��ٶ�')