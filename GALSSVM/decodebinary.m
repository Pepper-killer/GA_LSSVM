% 二进制编码转换为两组十进制编码
function pop2 = decodebinary(pop)
% 输入pop为初始化种群，输出pop2,pop3为染色体解码值
% 功能是将二进制染色体解码为十进制
% 编写于2020.11.26               written by Benedictor_Xu
% fprintf('**************************************\n');
% fprintf('        开始解码              written\n');
% fprintf('              ...                         by\n');
[px,py] = size(pop);
for i = 1:py
    pop1(:,i) = 2.^(py - i).*pop(:,i);
end
pop2 = sum(pop1,2);
% fprintf('        解码完成        Benedictor_Xu\n');
% fprintf('**************************************\n');

