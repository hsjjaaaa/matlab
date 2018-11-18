%PO�۲�ڵ�ѹ�� GO�۲�ܶ����� S����ϵ��
%��ֵ �ڵ��ܶκ� ����

function [sum] = dragCoefficientIdentification(A,D,Re,u,p,S,e,PO,GO)
sum=0;
[G_Cal,P_Cal] = hydraulicCalculation(A,D,Re,u,p,S,e);
%��ȡ��������
[p_length,~]=size(PO);
[g_length,~]=size(GO);

%��ѹ��
for i=1:p_length
  poi=PO(p_length,1);
  poi_num=PO(p_length,2);
  pci=P_Cal(poi_num);
  sum=sum+(poi-pci)^2;
end

%������
for i=1:g_length
  goi=GO(g_length,1);
  goi_num=PO(g_length,2);
  gci=G_Cal(goi_num);
  sum=sum+(goi-gci)^2;
end

end
