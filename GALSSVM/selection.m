% ѡ���ƣ��������̶�ģ�ͣ���Ⱥ��������
% �����еĸ���ᱻ������Ӧ�ȸ��ߵĸ���ͬ��
function [newpop] = selection (pop,fitvalue)
% ����popΪ��ʼ��Ⱥ��fitvalueΪ��Ӧ������
% ���newpopΪ���̶�ģ��ѡ��������Ⱥ
% ��д��2020.11.27      �޶���2020.12.1      written by Benedictor_Xu
% ��Ⱥ����Ӧ��ֵ
totalfit = sum(fitvalue);
% �������屻ѡ�еĸ���
fitvalue = fitvalue/totalfit;
% ֱ����i�����帲�ǵĸ��ʷ�Χ
fitvalue = cumsum(fitvalue);
% ԭ��Ⱥ��ģ
[px,py] = size(pop);
% ���˴�ת�̣�����
% ms = sort(rand(px,1));
ms = linspace(1/px,0.9999,px);
% �¾����
fitin = 1;
newin = 1;
% ��ʼѡ����
while newin<=px
    if ms(newin)<=fitvalue(fitin)
% ����Ҫע�����б任��matlab�����Ǵ�ģ���
        newpop(newin,:) = pop(fitin,:);
        newin = newin + 1;
    else
        fitin = fitin + 1;
    end
end
end
