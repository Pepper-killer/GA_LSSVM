% 主程序：GA-SVM回归程序
% 编写于2020.11.28        
% 修订于2020.12.1         
% written by Benedictor_Xu
clear all
clc
% 定义种群大小
popsize = 20;
chromlength = 8;
% 初始化遗传代数
genx = 500;
% 定义交叉与变异概率
pc = 0.6;
pm = 0.01;
% 初始化训练集
global X Y type;
load bb_input
type = 'function estimation';
Ydat = Y;
% X = [];
% Y = Ydat(:,1);
% Y = Ydat(:,2);
% Y = Ydat(:,3);
Y = Ydat(:,4);
% 初始化测试集
global Xt Yorg;
% Xt = [];
Xt = X;
% Yorg = Ydat(:,1);
% Yorg = Ydat(:,2);
% Yorg = Ydat(:,3);
Yorg = Ydat(:,4);
% 初始化种群
pop = initpop(popsize,chromlength);
% 获取种群规模
[px,py] = size(pop);
% sig2种群精度：e1      
% gam种群精度：e2
e1 = 1/(2^((py/2)+1));
e2 = 1000/(2^((py/2)+1));
% 初始化种群观测值
pop1 = pop;
% 初始化最佳适应度值
bestfitvalue = 0;
% 初始化结束标志
flag = false;
% 进度
h=waitbar(0,'优化计算中，请稍候！',...
    'CreateCancelBtn','flag = true');
% 遗传genx代
for i = 1:genx
% 求取种群拟合精度
    [objvalue] = calobjvalue(pop);
% 求取种群适应度
    fitvalue = calfitvalue(objvalue);
% 选择交叉变异
    [newpop] = selection (pop,fitvalue);
    [newpop] = crossover(newpop,pc);
    [newpop] = mutation(newpop,pm);
% 读取最佳个体与最佳适应度以及每代的最佳参数
    [bestindividual,bestfit(i)] = best(pop,fitvalue);
    if bestfit(i) >= bestfitvalue
        bestfitvalue = bestfit(i);
        realbestindividual = bestindividual;
    end
    pop5 = realbestindividual;
    sig2 = decodechrom(pop5,1,py/2);
    gam = decodechrom(pop5,(py/2)+1,py/2);
    pop = newpop;
    str=['GA-LSSVM优化计算中...第',num2str(i), ...
        '代...',num2str(i/genx*100),'%'];
    waitbar(i/genx,h,str);
    if flag
        break
    end
end
if i<genx
    waitbar(i/genx,h,'优化中止(designed by benedictor xu)');
else
    waitbar(i/genx,h,'优化完成(designed by benedictor xu)');
end
pause(3);
delete(h);
sig2 = sig2*e1;
gam =gam*e2;
[alpha,b] = trainlssvm({X,Y,type,gam,sig2,'RBF_kernel'});
plotlssvm({X,Y,type,gam,sig2,'RBF_kernel'},{alpha,b});
figure(2);
plot(1:i,bestfit);
bestfitvalue
bestfit