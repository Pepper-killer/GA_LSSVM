% �����㷨��ÿ������֮����һ������pc����
function [newpop] = crossover(pop,pc)
% ����popΪ����ǰ����Ⱥ
% ���Ϊԭ��Ⱥ��һ�����ʽ���������Ⱥ
% ��д��2020.11.27              written by Benedictor_Xu
% ȡ��ԭ��Ⱥ��ģ
[px,py] = size(pop);
% ������ԭ��Ⱥ��ģ��ͬ��ȫ1����
newpop = ones(size(pop));
% ������pc��������
for i = 1:2:px-1
    if (rand<pc)
        cpoint = round(rand*py);
        newpop(i,:) = [pop(i,1:cpoint),pop(i+1,cpoint+1:py)];
        newpop(i+1,:) = [pop(i+1,1:cpoint),pop(i,cpoint+1:py)];
    else
         newpop(i,:) = pop(i,:);
         newpop(i+1,:) = pop(i+1,:);
    end
end
end