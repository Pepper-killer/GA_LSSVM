% �����Ʊ���ת��Ϊ����ʮ���Ʊ���
function pop2 = decodebinary(pop)
% ����popΪ��ʼ����Ⱥ�����pop2,pop3ΪȾɫ�����ֵ
% �����ǽ�������Ⱦɫ�����Ϊʮ����
% ��д��2020.11.26               written by Benedictor_Xu
% fprintf('**************************************\n');
% fprintf('        ��ʼ����              written\n');
% fprintf('              ...                         by\n');
[px,py] = size(pop);
for i = 1:py
    pop1(:,i) = 2.^(py - i).*pop(:,i);
end
pop2 = sum(pop1,2);
% fprintf('        �������        Benedictor_Xu\n');
% fprintf('**************************************\n');

