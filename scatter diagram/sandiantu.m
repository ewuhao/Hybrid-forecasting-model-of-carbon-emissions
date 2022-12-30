clc;
close all;
clear all;
% %% 加载数据
% load('CSA-LSSVM_SSC_China_VMD_sum_realdata.mat')
% load('China_compare.mat')
% load('b2_test_real.mat')
% sum_realdata=b2_test_real;

% load('b3_test_real.mat')
% sum_realdata=b3_test_real;
% load('BP_b2.mat')
% pre1=BP_b2(5:144);
% load('BP_b3.mat')
% pre2=BP_b3(5:144);
% load('LSTM_b2.mat')
% pre3=LSTM_b2(5:144);
% load('LSTM_b3.mat')
% pre4=LSTM_b3(4:143);
% load('KELM_b2.mat')
% pre5=KELM_b2;
% load('KELM_b3.mat')
% pre6=KELM_b3;
% load('ARO_KELM_b2.mat')
% pre7=ARO_KELM_b2;
% load('ARO_KELM_b3.mat')
% pre8=ARO_KELM_b3;
% load('CEEMDAN_ARO_KELM_b2.mat')
% pre9=CEEMDAN_ARO_KELM_b2;
% load('CEEMDAN_ARO_KELM_b3.mat')
% pre10=CEEMDAN_ARO_KELM_b3;
% load('CEEMDAN_NNetEn_NVMD_ARO_KELM_b2.mat')
% pre11=CEEMDAN_NNetEn_NVMD_ARO_KELM_b2;
% load('CEEMDAN_NNetEn_NVMD_ARO_KELM_b3.mat')
% pre12=CEEMDAN_NNetEn_NVMD_ARO_KELM_b3;
% load('EC_b2.mat')
% pre13=EC_b2(600:739);
% load('EC_b3.mat')
% pre14=EC_b3(600:739);

% load('CPA-KELM_SSC_US_VMD_sum_realdata.mat')
% load('US_compare.mat')
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
%% 相关分布图
figure(6)
n=3;
CData = 0:1/(length(data)-1):1;% 保持数据长度一致
subplot(331)
scatter(data(:),pre1(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M2');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
set(gca,'LooseInset',get(gca,'TightInset'))

subplot(332)
scatter(data(:),pre3(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M1');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
subplot(333)
scatter(data(:),pre5(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M4');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
subplot(334)
scatter(data(:),pre7(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M3');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
subplot(335)
scatter(data(:),pre9(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M6');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
subplot(336)
scatter(data(:),pre11(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M5');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
subplot(337)
scatter(data(:),pre13(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M7');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
subplot(338)
scatter(data(:),pre15(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M8');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
subplot(339)
scatter(data(:),pre17(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M9');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
% subplot(248)
% scatter(sum_realdata(:),CSA_LSSVM_SSC_US_VMD_iowa_forecastdata_err(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('C-CSSD-VMD-CPA-KELM-IOWA-CSA-LSSVM-EC');set(gca,'fontname','times New Roman');
% set(gca,'fontsize',12.0)
set(gcf,'Position',[1,1,500,700]);
 set(gca,'LooseInset',get(gca,'TightInset'))
%  set(gca,'looseInset',[0 0 0 0])
% % %计算相关系数
 a=corrcoef(data,pre1');zipreM2=a(1,2)
 a=corrcoef(data,pre3');zipreM1=a(1,2)
 a=corrcoef(data,pre5');zipreM4=a(1,2)
 a=corrcoef(data,pre7);zipreM3=a(1,2)
 a=corrcoef(data,pre9');zipreM6=a(1,2)
 a=corrcoef(data,pre11');zipreM5=a(1,2)
 a=corrcoef(data,pre13);zipreM7=a(1,2)
  a=corrcoef(data,pre15');zipreM8=a(1,2)
 a=corrcoef(data,pre17);zipreM9=a(1,2)
% a=corrcoef(sum_realdata,CSA_LSSVM_SSC_US_VMD_iowa_forecastdata_err);zipre_2VMD_GKELM=a(1,2)





figure(7)
n=3;
CData = 0:1/(length(data1)-1):1;% 保持数据长度一致
subplot(331)
scatter(data1(:),pre2(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M2');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
set(gca,'LooseInset',get(gca,'TightInset'))

subplot(332)
scatter(data1(:),pre4(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M1');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
subplot(333)
scatter(data1(:),pre6(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M4');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
subplot(334)
scatter(data1(:),pre8(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M3');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
subplot(335)
scatter(data1(:),pre10(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M6');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
subplot(336)
scatter(data1(:),pre12(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M5');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
subplot(337)
scatter(data1(:),pre14(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M7');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
subplot(338)
scatter(data1(:),pre16(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M8');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
subplot(339)
scatter(data1(:),pre18(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('M9');set(gca,'fontname','times New Roman');
set(gca,'fontsize',12.0)
% subplot(248)
% scatter(sum_realdata(:),CSA_LSSVM_SSC_US_VMD_iowa_forecastdata_err(:),n,CData,'filled');colorbar;ylabel('True Data');xlabel('Predicted Data');title('C-CSSD-VMD-CPA-KELM-IOWA-CSA-LSSVM-EC');set(gca,'fontname','times New Roman');
% set(gca,'fontsize',12.0)
set(gcf,'Position',[1,1,500,700]);
 set(gca,'LooseInset',get(gca,'TightInset'))
%  set(gca,'looseInset',[0 0 0 0])
% % %计算相关系数
 a=corrcoef(data1,pre2');zipreM2=a(1,2)
 a=corrcoef(data1,pre4');zipreM1=a(1,2)
 a=corrcoef(data1,pre6');zipreM4=a(1,2)
 a=corrcoef(data1,pre8);zipreM3=a(1,2)
 a=corrcoef(data1,pre10');zipreM6=a(1,2)
 a=corrcoef(data1,pre12');zipreM5=a(1,2)
 a=corrcoef(data1,pre14);zipreM7=a(1,2)
  a=corrcoef(data1,pre16');zipreM8=a(1,2)
 a=corrcoef(data1,pre18);zipreM9=a(1,2)
% a=corrcoef(sum_realdata,CSA_LSSVM_SSC_US_VMD_iowa_forecastdata_err);zipre_2VMD_GKELM=a(1,2)