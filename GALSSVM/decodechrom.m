% ��������Ϊ�Զ����ȡ��Ⱥ�еĻ��򲢽���ʮ���ƽ���
function pop2 = decodechrom(pop,spoint,length)
% ����Ϊ��ʼ��Ⱥpop����ȡ��spoint����ȡ����length
% ���ΪȾɫ��ʮ���ƽ���ֵpop2
% pop1Ϊ����pop�Ľ�ȡ����������ȡ���������Ļ���
% pop2�����˽��뺯��decodebinary
% ��д��2020.11.27                  written by Benedictor_Xu
pop1 = pop(:,spoint:spoint+length-1);
pop2 = decodebinary(pop1);
end