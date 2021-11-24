% 函数功能为计算种群中所有个体的拟合精度
function [objvalue] = calobjvalue(pop)
% 输入矩阵pop为初始种群
% 输出拟合精度数组[objvalue]
% 编写于2020.11.27                    written by Benedictor_Xu
% 得到种群规模
[px,py] = size(pop);
% sig2种群精度：e1         修订于2020.11.30           gam种群精度：e2
e1 = 1/(2^(py/2));
e2 = 1000/(2^(py/2));
% 十进制解码
temp1 = decodechrom(pop,1,py/2);
temp2 = decodechrom(pop,(py/2)+1,py/2);
% 得到sig2与gam的特征数组
sig2 = temp1*e1;
gam = temp2*e2;
% 定义全局变量（训练集和测试集）
global X Y type Xt Yorg;
% 回归功能
% 种群全部个体参与回归
for i = 1:px
% 去除gam的零值
    if gam(i) == 0
        objvalue(i) = 10;
    else
% 训练得到alpha,b
    [alpha,b] = trainlssvm({X,Y,type,gam(i),sig2(i),'RBF_kernel'});
% 得到测试集输出
    Yt = simlssvm({X,Y,type,gam(i),sig2(i),'RBF_kernel','preprocess'},{alpha,b},Xt);
% 拟合精度
    objvalue(i) = (Yt - Yorg).'*(Yt - Yorg);
    end
end