tic
clc,clear,close all
warning off
dim=2;
lb=[1500,3]; % ����ȡֵ�½�
ub=[3500,9]; % ����ȡֵ�Ͻ�
fobj=@func_1;
format long;
disp('DOA���ڽ����������')
SearchAgents_no=100; % number of dingoes
Max_iteration=10; % Maximum numbef of iterations
% Load details of the selected benchmark function
[vMin,theBestVct,Convergence_curve]=DOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
%����������ͼ
r=[1:1:11];
plot(r,Convergence_curve,'r--','linewidth',2);
set(gca, 'FontSize', 12);
xlabel('lteration','FontSize',16),ylabel('Best score','FontSize',16)
% title('�Ľ�VMD�㷨')
hold on
xm = floor(theBestVct)
fv = vMin


toc