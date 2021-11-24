% 变异算法：父代个体的每一位按一定概率pm翻转
function [newpop] = mutation(pop,pm)
% 输入pop为原种群
% 输入pm为变异概率
% 输出newpop为变异后的新种群
% 编写于2020.11.27               written by Benedictor_Xu
% 获取原种群规模
[px,py] = size(pop);
% 初始化新种群
newpop = ones(size(pop));
% 按概率pm进行变异操作
for i = 1:px
    if (rand<pm)
% 变异点
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