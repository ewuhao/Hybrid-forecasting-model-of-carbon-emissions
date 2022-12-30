tic
clc,clear,close all
warning off
dim=2;
lb=[1500,3]; % 参数取值下界
ub=[3500,9]; % 参数取值上界
fobj=@func_1;
format long;
disp('DOA正在解决您的问题')
SearchAgents_no=100; % number of dingoes
Max_iteration=10; % Maximum numbef of iterations
% Load details of the selected benchmark function
[vMin,theBestVct,Convergence_curve]=DOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
%迭代次数画图
r=[1:1:11];
plot(r,Convergence_curve,'r--','linewidth',2);
set(gca, 'FontSize', 12);
xlabel('lteration','FontSize',16),ylabel('Best score','FontSize',16)
% title('改进VMD算法')
hold on
xm = floor(theBestVct)
fv = vMin


toc