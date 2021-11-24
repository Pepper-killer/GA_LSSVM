%种群初始化
function pop = initpop(popsize,chromlength)
pop = round(rand(popsize,chromlength));
% popsize为群体大小，chromlength代表染色体长度
% 当前群体大小初定为225，染色体长度初定为8
% sig2精度e1 = 6.67e-2
% gam精度e2 = 6.66667e1
% pop = round(rand(225,8));随机生成225*8的种群
% 以上程序编码随机生成，缺点是无法剔除零点
% 编写于2020.11.26              written by Benedictor_Xu
end