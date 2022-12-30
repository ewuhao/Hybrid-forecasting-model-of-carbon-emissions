
clc,clear,close all
load Convergence_curve_r.mat
Convergence_curve=Convergence_curve(1:30);
r=[1:1:30];
plot(r,Convergence_curve,'r--','linewidth',2);
set(gca, 'FontSize', 12);
xlabel('lteration','FontSize',16),ylabel('Best score','FontSize',16)