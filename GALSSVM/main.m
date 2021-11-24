% ������GA-SVM�ع����
% ��д��2020.11.28        
% �޶���2020.12.1         
% written by Benedictor_Xu
clear all
clc
% ������Ⱥ��С
popsize = 20;
chromlength = 8;
% ��ʼ���Ŵ�����
genx = 500;
% ���彻����������
pc = 0.6;
pm = 0.01;
% ��ʼ��ѵ����
global X Y type;
load bb_input
type = 'function estimation';
Ydat = Y;
% X = [];
% Y = Ydat(:,1);
% Y = Ydat(:,2);
% Y = Ydat(:,3);
Y = Ydat(:,4);
% ��ʼ�����Լ�
global Xt Yorg;
% Xt = [];
Xt = X;
% Yorg = Ydat(:,1);
% Yorg = Ydat(:,2);
% Yorg = Ydat(:,3);
Yorg = Ydat(:,4);
% ��ʼ����Ⱥ
pop = initpop(popsize,chromlength);
% ��ȡ��Ⱥ��ģ
[px,py] = size(pop);
% sig2��Ⱥ���ȣ�e1      
% gam��Ⱥ���ȣ�e2
e1 = 1/(2^((py/2)+1));
e2 = 1000/(2^((py/2)+1));
% ��ʼ����Ⱥ�۲�ֵ
pop1 = pop;
% ��ʼ�������Ӧ��ֵ
bestfitvalue = 0;
% ��ʼ��������־
flag = false;
% ����
h=waitbar(0,'�Ż������У����Ժ�',...
    'CreateCancelBtn','flag = true');
% �Ŵ�genx��
for i = 1:genx
% ��ȡ��Ⱥ��Ͼ���
    [objvalue] = calobjvalue(pop);
% ��ȡ��Ⱥ��Ӧ��
    fitvalue = calfitvalue(objvalue);
% ѡ�񽻲����
    [newpop] = selection (pop,fitvalue);
    [newpop] = crossover(newpop,pc);
    [newpop] = mutation(newpop,pm);
% ��ȡ��Ѹ����������Ӧ���Լ�ÿ������Ѳ���
    [bestindividual,bestfit(i)] = best(pop,fitvalue);
    if bestfit(i) >= bestfitvalue
        bestfitvalue = bestfit(i);
        realbestindividual = bestindividual;
    end
    pop5 = realbestindividual;
    sig2 = decodechrom(pop5,1,py/2);
    gam = decodechrom(pop5,(py/2)+1,py/2);
    pop = newpop;
    str=['GA-LSSVM�Ż�������...��',num2str(i), ...
        '��...',num2str(i/genx*100),'%'];
    waitbar(i/genx,h,str);
    if flag
        break
    end
end
if i<genx
    waitbar(i/genx,h,'�Ż���ֹ(designed by benedictor xu)');
else
    waitbar(i/genx,h,'�Ż����(designed by benedictor xu)');
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