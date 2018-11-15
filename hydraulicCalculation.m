%A基本关联矩阵 D为管段长度 Re雷诺数 u粘合数 p密度 S阻力系数 e精度
function [G_New,P] = hydraulicCalculation(A,D,Re,u,p,S,e)
%A的行数为管段数 列数为节点数
[m,n]=size(A);
%拟定初始管段流量G
G=Re*(u*pi*D)/(4*p);
k=0;
while(1)
k=k+1;

%计算Q节点流量
Q=A*G;

%计算P节点压力 和管段流量绝对值对角矩阵
G_Abs=diag(abs(G));
r=S*G_Abs;
P=inv(A*(inv(r))*(A'))*Q;

%计算管段压降P_Drop
P_Drop=(A')*P;

%计算新流量G
G_New=P_Drop/r;

%判断是否达到精度 达到精度就跳出
if max(max(abs(G-G_New)))<e
    break;
end
%赋值给G
G=G_New;
end