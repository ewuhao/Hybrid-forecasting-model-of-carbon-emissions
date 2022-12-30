clc
clear
close all

% load data
% load preBP
% load preELM
% load preRNN
% load preKELM
% load preSTOAKELM
% 
% load preEMD_STOAKELM
% load preEEMD_STOAKELM
% load preCEEMDAN_STOAKELM
% load preCEEMDAN_NNetEn_VMD_STOAKELM
% load preCEEMDAN_NNetEn_STOAVMD_STOAKELM
load('real.mat')
data=real;
load('real_russia.mat')
data1=real;
load('BP_china.mat')
pre1=forcastdata;
load('BP_russia.mat')
pre2=forcastdata;
load('lssvm_china.mat')
pre3=forcastdata;
load('lssvm_russia.mat')
pre4=forcastdata;
load('HPOBP_china.mat')
pre5=forcastdata;
load('HPOBP_russia.mat')
pre6=forcastdata;
load('AVOA_LSSVM_china.mat')
pre7=forcastdata;
load('AVOA_LSSVM_russia.mat')
pre8=forcastdata;
load('DVMD_HPOBP_china.mat')
pre9=forecast;
load('DVMD_HPOBP_russia.mat')
pre10=forecast;
load('DVMD_AVOALSSVM_china.mat')
pre11=forecast;
load('DVMD_AVOALSSVM_russia.mat')
pre12=forecast;
load('DVMD_AVOALSSVM_HPOBP_china.mat')
pre13=predict;
load('DVMD_AVOALSSVM_HPOBP_russia.mat')
pre14=forecast;
load('DVMD_CEEMDAN_AVOALSSVM_HPOBP_china.mat')
pre15=forecast;
load('DVMD_CEEMDAN_AVOALSSVM_HPOBP_russia.mat')
pre16=forecast;
load('DVMD_CEEMDAN_AVOALSSVM_HPOBP_EC_china.mat')
pre17=forecast;
load('DVMD_CEEMDAN_AVOALSSVM_HPOBP_EC_russia.mat')
pre18=forecast;


figure(1)

plot(data,'k','linewidth',1.3);hold on;
plot(pre1 ,'y--','linewidth',1);hold on;
plot(pre3 ,'b--','linewidth',1);hold on;
plot(pre5, 'g--','linewidth',1);hold on;
plot(pre7,'r--','linewidth',1);hold on;
plot(pre9 ,'c--','linewidth',1);hold on;
plot(pre11 ,'b','linewidth',1);hold on;
plot(pre13 ,'y','linewidth',1);hold on;
plot(pre15,'r','linewidth',1);hold on;
plot(pre17 ,'c','linewidth',1);hold on;
lgd = legend('Actual value ','BP','LSSVM','HPOBP','AVOALSSVM','DVMD-HPOBP','DVMD-AVOALSSVM','DVMD-AVOALSSVM-HPOBP','DVMD-CEEMDAN-AVOALSSVM-HPOBP','DVMD-CEEMDAN-AVOALSSVM-HPOBP-EC');
lgd.NumColumns = 2;
ylim([0,50]);
ylabel('Wind power(MWh)');xlabel('Sampling point');set(gca,'fontsize',8.0);set(gca,'fontname','times New Roman');set(gcf,'Position',[347,162,600,250]);
 legend boxoff;
 
 figure(2)

plot(data1,'k','linewidth',1.3);hold on;
plot(pre2 ,'y--','linewidth',1);hold on;
plot(pre4 ,'b--','linewidth',1);hold on;
plot(pre6, 'g--','linewidth',1);hold on;
plot(pre8,'r--','linewidth',1);hold on;
plot(pre10 ,'c--','linewidth',1);hold on;
plot(pre12 ,'b','linewidth',1);hold on;
plot(pre14 ,'y','linewidth',1);hold on;
plot(pre16,'r','linewidth',1);hold on;
plot(pre18 ,'c','linewidth',1);hold on;
lgd = legend('Actual value ','BP','LSSVM','HPOBP','AVOALSSVM','DVMD-HPOBP','DVMD-AVOALSSVM','DVMD-AVOALSSVM-HPOBP','DVMD-CEEMDAN-AVOALSSVM-HPOBP','DVMD-CEEMDAN-AVOALSSVM-HPOBP-EC');
lgd.NumColumns = 2;
ylim([0,10]);
ylabel('Wind power(MWh)');xlabel('Sampling point');set(gca,'fontsize',8.0);set(gca,'fontname','times New Roman');set(gcf,'Position',[347,162,600,250]);
 legend boxoff;
% figure(2)
% 
% plot(data(16:26),'k','linewidth',1);hold on;
% plot(preBP(16:26) ,'y--','linewidth',1);hold on;
% plot(preELM(16:26) ,'b--','linewidth',1);hold on;
% plot(preRNN(16:26), 'g--','linewidth',1);hold on;
% plot(preKELM(16:26),'r--','linewidth',1);hold on;
% plot(preSTOAKELM(16:26) ,'c--','linewidth',1);hold on;
% plot(preEMD_STOAKELM(16:26) ,'b','linewidth',1);hold on;
% plot(preEEMD_STOAKELM(16:26) ,'y','linewidth',1);hold on;
% plot(preCEEMDAN_STOAKELM(16:26),'r','linewidth',1);hold on;
% plot(preCEEMDAN_NNetEn_VMD_STOAKELM(16:26) ,'c','linewidth',1);hold on;
% plot(preCEEMDAN_NNetEn_STOAVMD_STOAKELM(16:26),'m','linewidth',1);hold on;
% ylim([-0.5,2]);
% 
% lgd = legend('Actual value ','BP','ELM','RNN','KELM','STOAKELM','EMD-STOAKELM','EEMD-STOAKELM','CEEMDAN-STOAKELM','CEEMDAN-NNetEn-VMD-STOAKELM','CEEMDAN-NNetEn-STOAVMD-STOAKELM');
% lgd.NumColumns = 2;
% ylim([-1.5,4]);
% ylabel('Wind power(MWh)');xlabel('Sampling point');set(gca,'fontsize',8.0);set(gca,'fontname','times New Roman');set(gcf,'Position',[347,162,600,250]);
%  legend boxoff;

