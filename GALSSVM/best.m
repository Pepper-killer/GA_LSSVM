% 求出群体中适应度最大的值
function [bestindividual,bestfit] = best(pop,fitvalue)
% 输入pop为原种群
% 输入fitvalue为适应度数组
% 输出bestindividual为最佳个体
% 输出bestfit为最佳适应度
% 编写于2020.11.27            written by Benedictor_Xu
% 获取原种群规模
[px,py] = size(pop);
% 输出初始化
bestindividual = pop(1,:);
bestfit = fitvalue(1);
% 找输出最大值及个体
for i = 2:px
    if fitvalue(i) > bestfit
        bestindividual = pop(i,:);
        bestfit = fitvalue(i);
    end
end
end