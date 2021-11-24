% 将拟合精度取倒数，得到每个个体的适应度
function fitvalue = calfitvalue(objvalue)
% 输入objvalue为拟合精度数组
% 输出fitvalue为个体适应度数组
% 编写于2020.11.27                  written by Benedictor_Xu
fitvalue = 1./objvalue;
fitvalue = fitvalue';
end