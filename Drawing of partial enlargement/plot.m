clc;
clear ;
close all;

% color = [0 1 0  
% 0 1 1  
% 1 0 0  
% 1 0 1
% 1 .5 0
% 0 .5 0  
% 0 0 .5
% .5 0 0
% .5 .5 0
% .75 0 .75
% 0 .75 0
% .85 0 0.5
% 0.667 0.667 1
% ];
%% 所有模型结果
% all_res = [KELM_China_realdata
%     KELM_China_forecast
%     LSSVM_China_forecastdata
%     CSA_LSSVM_China_forecastdata
%    CPA_KELM_China_forecastdata
%    CSA_LSSVM_SSC_China_VMD_sum_forecastdata
%     CPA_KELM_SSC_China_VMD_sum_forecastdata
%     CSA_LSSVM_SSC_China_VMD_iowa_forecastdata
%     CPA_KELM_SSC_China_VMD_iowa_sum_forecastdata_err];
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
% all_res = [KELM_US_realdata
%     KELM_US_forecast
%     LSSVM_US_forecastdata
%     CSA_LSSVM_US_forecastdata
%    CPA_KELM_US_forecastdata
%    CSA_LSSVM_SSC_US_VMD_sum_forecastdata
%     CPA_KELM_SSC_US_VMD_sum_forecastdata
%     CSA_LSSVM_SSC_US_VMD_iowa_forecastdata
%     CSA_LSSVM_SSC_US_VMD_iowa_forecastdata_err];
% all_res = [KELM_US_error
%     LSSVM_US_error
%     CSA_LSSVM_US_error
%    CPA_KELM_US_error
%    CSA_LSSVM_SSC_US_VMD_sum_err
%    CPA_KELM_SSC_US_VMD_sum_err
%     CSA_LSSVM_SSC_US_VMD_iowa_forecastdata_error
%     CSA_LSSVM_SSC_US_VMD_iowa_forecastdata_err_error];
% all_res = [KELM_China_error
%     LSSVM_China_error
%     CSA_LSSVM_China_error
%     CPA_KELM_China_error
%     CSA_LSSVM_SSC_China_VMD_sum_err
%     CPA_KELM_SSC_China_VMD_sum_err
%     CSA_LSSVM_SSC_China_VMD_iowa_forecastdata_error
%     CPA_KELM_SSC_China_VMD_sum_forecastdata_er_error];
% 评价指标
% all_judge = Judge(all_res');
% %% beijing
% % IVMD-ChOACS-ORELM-EC
% figure(1)
% plot(all_res(end,:),'r-*','LineWidth',1.1);
% hold on;
% plot(all_res(end-1,:),'b-o','LineWidth',1.1);
% set(gca,'FontName','Times New Roman','FontSize',14)
% set(gca,'xtick',[0:20:144])
% xlim([1 B])
% ylim([0 160])
% xlabel('Sample points');
% ylabel('PM2.5 Value(μg/m³)');
% hl =legend('Actual','IVMD-ChOACS-ORELM-EC');
% set(hl,'Box','off');
%% 全部模型对比
figure(2)
subplot(2,1,1)
box on;
hold on
% plot(all_res(end,:),'k-*');
% hold on
% for i=1:A-4
%     plot(all_res(i,:),'--','color',color(i,:));
%     hold on
% end
% %  plot(all_res(9,:),'-','color',color(9,:),'LineWidth',1.1);
% %  plot(all_res(10,:),'-','color',color(10,:),'LineWidth',1.1);
% %  plot(all_res(11,:),'-','color',color(11,:),'LineWidth',1.1);
% %  plot(all_res(12,:),'-','color',color(12,:),'LineWidth',1.1);
% %  plot(all_res(5,:),'m-','LineWidth',1.1);
%  plot(all_res(6,:),'r-','LineWidth',1.1);
%  plot(all_res(7,:),'c-','LineWidth',1.1);
%   plot(all_res(8,:),'m-','LineWidth',1.1);
%   plot(all_res(9,:),'b-','LineWidth',1.1);
% plot(all_res(1,:),'-- ','LineWidth',2,'Color','#63B2EE');
% plot(all_res(2,:),'-- ','LineWidth',2,'Color','#76da91 ');
% plot(all_res(3,:),'-- ','LineWidth',2,'Color','#f8cb7f ');
% plot(all_res(4,:),'-- ','LineWidth',2,'Color','#f89588 ');
% plot(all_res(5,:),'-- ','LineWidth',2,'Color','#7cd6cf');
% plot(all_res(6,:),'LineWidth',2,'Color','#7cd6cf ');
% plot(all_res(7,:),'LineWidth',2,'Color','#41b7ac  ');
% plot(all_res(8,:),'LineWidth',2,'Color','#ffa510  ');
% plot(all_res(9,:),'LineWidth',2,'Color','#3b6291  ');
%%中国
Refer_Axis = zeros(1,length(data));
    Err1 = data-pre1;
    Err2 = data-pre3;
    Err3 = data-pre5;
    Err4 = data-pre7;
    Err5 = data-pre9;
    Err6 = data-pre11;
    Err7 = data-pre13;
    Err8 = data-pre15;
    Err9 = data-pre17;
    plot(Err1,'-','LineWidth',1,'Color','#0072BD')
    plot(Err2,':','LineWidth',1,'Color','#D95319')
    plot(Err3,'m-','LineWidth',1)
    plot(Err4,'c-','LineWidth',1)
    plot(Err5,'g-','LineWidth',1)
    plot(Err6,'b-','LineWidth',1)
    plot(Err7,'-','LineWidth',1,'Color','#2F4F4F')
    plot(Err8,'-','LineWidth',1,'Color','#8B4513')
    plot(Err9,'r-','LineWidth',3)
    plot(Refer_Axis,'k-','LineWidth',2)
set(gca,'FontName','Times New Roman','FontSize',20)
set(gca,'xtick',[0:10:150])
xlim([1 150])
ylim([-6 5])
xlabel('Sample points')
ylabel('Amplitude')
hl =legend({'M2','M1','M4','M3','M6','M5','M7','M8','M9'},'NumColumns',2,'FontName','Times New Roman','FontSize',26);
% hl =legend('KELM','LSSVM','CSA-LSSVM','CPA-KELM','C-CSSD-VMD-CSA-LSSVM','C-CSSD-VMD-CPA-KELM','C-CSSD-VMD-CPA-KELM-IOWA-CSA-LSSVM','C-CSSD-VMD-CPA-KELM-IOWA-CSA-LSSVM-EC','NumColumns',2);
set(hl,'Box','off');
%%俄罗斯
% Refer_Axis = zeros(1,length(data1));
%     Err1 = data1-pre2;
%     Err2 = data1-pre4;
%     Err3 = data1-pre6;
%     Err4 = data1-pre8;
%     Err5 = data1-pre10;
%     Err6 = data1-pre12;
%     Err7 = data1-pre14;
%     Err8 = data1-pre16;
%     Err9 = data1-pre18;
%     plot(Err1,'-','LineWidth',1,'Color','#0072BD')
%     plot(Err2,':','LineWidth',1,'Color','#D95319')
%     plot(Err3,'m-','LineWidth',1)
%     plot(Err4,'c-','LineWidth',1)
%     plot(Err5,'g-','LineWidth',1)
%     plot(Err6,'b-','LineWidth',1)
%     plot(Err7,'-','LineWidth',1,'Color','#2F4F4F')
%     plot(Err8,'-','LineWidth',1,'Color','#8B4513')
%     plot(Err9,'r-','LineWidth',3)
%     plot(Refer_Axis,'k-','LineWidth',2)
% set(gca,'FontName','Times New Roman','FontSize',20)
% set(gca,'xtick',[0:10:150])
% xlim([1 150])
% ylim([-1.3 1.5])
% xlabel('Sample points')
% ylabel('Amplitude')
% hl =legend({'M2','M1','M4','M3','M6','M5','M7','M8','M9'},'NumColumns',2,'FontName','Times New Roman','FontSize',24);
% % hl =legend('KELM','LSSVM','CSA-LSSVM','CPA-KELM','C-CSSD-VMD-CSA-LSSVM','C-CSSD-VMD-CPA-KELM','C-CSSD-VMD-CPA-KELM-IOWA-CSA-LSSVM','C-CSSD-VMD-CPA-KELM-IOWA-CSA-LSSVM-EC','NumColumns',2);
% set(hl,'Box','off');
%% 误差图
% figure
% box on;
% hold on;
% % for i=2:A-3
% %      plot(all_res(i,:)-all_res(1,:),'--','color',color(i+3,:),'LineWidth',2);
% %      hold on;
% % end
% plot(all_res(2,:)-all_res(1,:),'-- ','LineWidth',3,'Color','#63B2EE');
% plot(all_res(3,:)-all_res(1,:),'-- ','LineWidth',3,'Color','#76da91 ');
% plot(all_res(4,:)-all_res(1,:),'-- ','LineWidth',3,'Color','#f8cb7f ');
% plot(all_res(5,:)-all_res(1,:),'-- ','LineWidth',3,'Color','#f89588 ');
% plot(all_res(6,:)-all_res(1,:),'- ','LineWidth',3,'Color','#7cd6cf');
% % plot(all_res(7,:),'LineWidth',2,'Color','#7cd6cf ');
% %  plot(all_res(5,:)-all_res(1,:),'r-','LineWidth',2);
% %  plot(all_res(6,:)-all_res(1,:),'c-','LineWidth',2);
%   plot(all_res(7,:)-all_res(1,:),'g-','LineWidth',3);
%   plot(all_res(8,:)-all_res(1,:),'b-','LineWidth',3);
%     plot(all_res(9,:)-all_res(1,:),'r-','LineWidth',3);
% set(gca,'FontName','Times New Roman','FontSize',24)
% set(gca,'xtick',[0:20:140])
% xlim([1 B])
% % ylim([-3 3])
% % ylim([-50 80])
% xlabel('Sample points','FontName','Times New Roman','FontSize',24)
% ylabel('Amplitude','FontName','Times New Roman','FontSize',24);
% hl =legend('KELM','LSSVM','CSA-LSSVM','CPA-KELM','C-CSSD-VMD-CSA-LSSVM','C-CSSD-VMD-CPA-KELM','C-CSSD-VMD-CPA-KELM-IOWA-CSA-LSSVM','C-CSSD-VMD-CPA-KELM-IOWA-CSA-LSSVM-EC','NumColumns',2,'FontName','Times New Roman','FontSize',24);
% set(hl,'Box','off');
% set(gca,'looseInset',[0 0 0 0])

% h6=figure;
% % set(h6,'position',[0.082738093269013,0.1087301559628,0.896726193057284,0.871031749402247]);
% % plot(sum_realdata,'b-o')
% plot(sum_realdata,'LineWidth',2,'Color',[128,184,223]/256);
% hold on
% % plot(test_sim1,'r-*')
% plot(sum_forecastdata,'LineWidth',2,'Color',[254,129,125]/256);
% h2 = legend('Actual data','C-CSSD-NNetEn-VMD-CSA-LSSVM','FontName','Times New Roman','FontSize',12);
% set(h2,'box','off')
% xlabel('Sample points','FontName','Times New Roman','FontSize',14)
% ylabel('Carbon emission(mt)','FontName','Times New Roman','FontSize',14)
% set(gca,'looseInset',[0 0 0.01 0])
