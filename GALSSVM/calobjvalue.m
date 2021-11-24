% ��������Ϊ������Ⱥ�����и������Ͼ���
function [objvalue] = calobjvalue(pop)
% �������popΪ��ʼ��Ⱥ
% �����Ͼ�������[objvalue]
% ��д��2020.11.27                    written by Benedictor_Xu
% �õ���Ⱥ��ģ
[px,py] = size(pop);
% sig2��Ⱥ���ȣ�e1         �޶���2020.11.30           gam��Ⱥ���ȣ�e2
e1 = 1/(2^(py/2));
e2 = 1000/(2^(py/2));
% ʮ���ƽ���
temp1 = decodechrom(pop,1,py/2);
temp2 = decodechrom(pop,(py/2)+1,py/2);
% �õ�sig2��gam����������
sig2 = temp1*e1;
gam = temp2*e2;
% ����ȫ�ֱ�����ѵ�����Ͳ��Լ���
global X Y type Xt Yorg;
% �ع鹦��
% ��Ⱥȫ���������ع�
for i = 1:px
% ȥ��gam����ֵ
    if gam(i) == 0
        objvalue(i) = 10;
    else
% ѵ���õ�alpha,b
    [alpha,b] = trainlssvm({X,Y,type,gam(i),sig2(i),'RBF_kernel'});
% �õ����Լ����
    Yt = simlssvm({X,Y,type,gam(i),sig2(i),'RBF_kernel','preprocess'},{alpha,b},Xt);
% ��Ͼ���
    objvalue(i) = (Yt - Yorg).'*(Yt - Yorg);
    end
end