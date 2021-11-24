% 函数功能为自定义截取种群中的基因并进行十进制解码
function pop2 = decodechrom(pop,spoint,length)
% 输入为初始种群pop，截取点spoint，截取长度length
% 输出为染色体十进制解码值pop2
% pop1为矩阵pop的截取矩阵，用以提取独立参数的基因
% pop2调用了解码函数decodebinary
% 编写于2020.11.27                  written by Benedictor_Xu
pop1 = pop(:,spoint:spoint+length-1);
pop2 = decodebinary(pop1);
end