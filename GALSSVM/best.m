% ���Ⱥ������Ӧ������ֵ
function [bestindividual,bestfit] = best(pop,fitvalue)
% ����popΪԭ��Ⱥ
% ����fitvalueΪ��Ӧ������
% ���bestindividualΪ��Ѹ���
% ���bestfitΪ�����Ӧ��
% ��д��2020.11.27            written by Benedictor_Xu
% ��ȡԭ��Ⱥ��ģ
[px,py] = size(pop);
% �����ʼ��
bestindividual = pop(1,:);
bestfit = fitvalue(1);
% ��������ֵ������
for i = 2:px
    if fitvalue(i) > bestfit
        bestindividual = pop(i,:);
        bestfit = fitvalue(i);
    end
end
end