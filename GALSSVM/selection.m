% 选择复制，采用轮盘赌模型，种群总数不变
% 但是有的个体会被其他适应度更高的个体同化
function [newpop] = selection (pop,fitvalue)
% 输入pop为初始种群，fitvalue为适应度数组
% 输出newpop为轮盘赌模型选择后的新种群
% 编写于2020.11.27      修订于2020.12.1      written by Benedictor_Xu
% 种群总适应度值
totalfit = sum(fitvalue);
% 单个个体被选中的概率
fitvalue = fitvalue/totalfit;
% 直到第i个个体覆盖的概率范围
fitvalue = cumsum(fitvalue);
% 原种群规模
[px,py] = size(pop);
% 幸运大转盘！！！
% ms = sort(rand(px,1));
ms = linspace(1/px,0.9999,px);
% 新旧序号
fitin = 1;
newin = 1;
% 开始选择复制
while newin<=px
    if ms(newin)<=fitvalue(fitin)
% 这里要注意是行变换，matlab书里是错的，淦
        newpop(newin,:) = pop(fitin,:);
        newin = newin + 1;
    else
        fitin = fitin + 1;
    end
end
end
