%A������������ DΪ�ܶγ��� Re��ŵ�� uճ���� p�ܶ� S����ϵ�� e����
function [G_New,P] = hydraulicCalculation(A,D,Re,u,p,S,e)
%A������Ϊ�ܶ��� ����Ϊ�ڵ���
[m,n]=size(A);
%�ⶨ��ʼ�ܶ�����G
G=Re*(u*pi*D)/(4*p);
k=0;
while(1)
k=k+1;

%����Q�ڵ�����
Q=A*G;

%����P�ڵ�ѹ�� �͹ܶ���������ֵ�ԽǾ���
G_Abs=diag(abs(G));
r=S*G_Abs;
P=inv(A*(inv(r))*(A'))*Q;

%����ܶ�ѹ��P_Drop
P_Drop=(A')*P;

%����������G
G_New=P_Drop/r;

%�ж��Ƿ�ﵽ���� �ﵽ���Ⱦ�����
if max(max(abs(G-G_New)))<e
    break;
end
%��ֵ��G
G=G_New;
end