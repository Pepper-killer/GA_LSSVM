% 交叉算法，每个个体之间以一定概率pc交叉
function [newpop] = crossover(pop,pc)
% 输入pop为交叉前的种群
% 输出为原种群按一定概率交叉后的新种群
% 编写于2020.11.27              written by Benedictor_Xu
% 取得原种群规模
[px,py] = size(pop);
% 产生与原种群规模相同的全1矩阵
newpop = ones(size(pop));
% 按概率pc两两交叉
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