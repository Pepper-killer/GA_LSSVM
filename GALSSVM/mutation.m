% �����㷨�����������ÿһλ��һ������pm��ת
function [newpop] = mutation(pop,pm)
% ����popΪԭ��Ⱥ
% ����pmΪ�������
% ���newpopΪ����������Ⱥ
% ��д��2020.11.27               written by Benedictor_Xu
% ��ȡԭ��Ⱥ��ģ
[px,py] = size(pop);
% ��ʼ������Ⱥ
newpop = ones(size(pop));
% ������pm���б������
for i = 1:px
    if (rand<pm)
% �����
        mpoint = round(rand*py);
        if mpoint<=0
            mpoint = 1;
        end
        newpop(i,:) = pop(i,:);
        if any(newpop(i,mpoint)) == 0
            newpop(i,mpoint) = 1;
        else
            newpop(i,mpoint) = 0;
        end
    else
        newpop(i,:) = pop(i,:);
    end
end