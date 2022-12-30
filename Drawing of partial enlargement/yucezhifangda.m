clc;
clear ;
close all;
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
figure(2)
subplot(2,1,1)
box on;
hold on
%中国
    plot(data,'k-','LineWidth',3)
    plot(pre3,'-','LineWidth',1,'Color','#0072BD')
    plot(pre1,':','LineWidth',1,'Color','#D95319')
    plot(pre7,'m-','LineWidth',1)
    plot(pre5,'c-','LineWidth',1)
    plot(pre11,'g-','LineWidth',1)
    plot(pre9,'b-','LineWidth',1)
    plot(pre13,'-','LineWidth',1,'Color','#2F4F4F')
    plot(pre15,'-','LineWidth',1,'Color','#8B4513')
    plot(pre17,'r-','LineWidth',3)
    
set(gca,'FontName','Times New Roman','FontSize',20)
set(gca,'xtick',[0:10:150])
xlim([1 150])
ylim([18 40])
xlabel('Sample points')
ylabel('Carbon emissions(mt)')
hl =legend({'Actual data','M1','M2','M3','M4','M5','M6','M7','M8','M9'},'NumColumns',2,'FontName','Times New Roman','FontSize',26);
% hl =legend('KELM','LSSVM','CSA-LSSVM','CPA-KELM','C-CSSD-VMD-CSA-LSSVM','C-CSSD-VMD-CPA-KELM','C-CSSD-VMD-CPA-KELM-IOWA-CSA-LSSVM','C-CSSD-VMD-CPA-KELM-IOWA-CSA-LSSVM-EC','NumColumns',2);
set(hl,'Box','off');
% 部分图
subplot(2,1,2)
box on;
% plot(all_res(end,:),'k-*');
hold on
% for i=1:A-4
%     plot(all_res(i,:),'--','color',color(i,:));
% end
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
% plot(all_res(7,:),'LineWidth',2,'Color','#eddd86   ');
% plot(all_res(8,:),'LineWidth',2,'Color','#ffa510  ');
% plot(all_res(9,:),'LineWidth',2,'Color','#3b6291  ');
    plot(pre3,'-','LineWidth',1,'Color','#0072BD')
    plot(pre1,':','LineWidth',1,'Color','#D95319')
    plot(pre7,'m-','LineWidth',1)
    plot(pre5,'c-','LineWidth',1)
    plot(pre11,'g-','LineWidth',1)
    plot(pre9,'b-','LineWidth',1)
    plot(pre13,'-','LineWidth',1,'Color','#2F4F4F')
    plot(pre15,'-','LineWidth',1,'Color','#8B4513')
    plot(pre17,'r-','LineWidth',3)
     plot(data,'k-','LineWidth',2)
set(gca,'FontName','Times New Roman','FontSize',20)
set(gca,'xtick',[0:10:140])
set(gca,'ytick',[]);
xlim([50 60])
%俄罗斯
%     plot(data1,'k-','LineWidth',3)
%     plot(pre4,'-','LineWidth',1,'Color','#0072BD')
%     plot(pre2,':','LineWidth',1,'Color','#D95319')
%     plot(pre8,'m-','LineWidth',1)
%     plot(pre6,'c-','LineWidth',1)
%     plot(pre12,'g-','LineWidth',1)
%     plot(pre10,'b-','LineWidth',1)
%     plot(pre14,'-','LineWidth',1,'Color','#2F4F4F')
%     plot(pre16,'-','LineWidth',1,'Color','#8B4513')
%     plot(pre18,'r-','LineWidth',3)
%     
% set(gca,'FontName','Times New Roman','FontSize',20)
% set(gca,'xtick',[0:10:150])
% xlim([1 150])
% ylim([3 6])
% xlabel('Sample points')
% ylabel('Carbon emissions(mt)')
% hl =legend({'Actual data','M1','M2','M3','M4','M5','M6','M7','M8','M9'},'NumColumns',2,'FontName','Times New Roman','FontSize',26);
% % hl =legend('KELM','LSSVM','CSA-LSSVM','CPA-KELM','C-CSSD-VMD-CSA-LSSVM','C-CSSD-VMD-CPA-KELM','C-CSSD-VMD-CPA-KELM-IOWA-CSA-LSSVM','C-CSSD-VMD-CPA-KELM-IOWA-CSA-LSSVM-EC','NumColumns',2);
% set(hl,'Box','off');
% % 部分图
% subplot(2,1,2)
% box on;
% % plot(all_res(end,:),'k-*');
% hold on
% % for i=1:A-4
% %     plot(all_res(i,:),'--','color',color(i,:));
% % end
% % %  plot(all_res(5,:),'m-','LineWidth',1.1);
% %  plot(all_res(6,:),'r-','LineWidth',1.1);
% %  plot(all_res(7,:),'c-','LineWidth',1.1);
% %   plot(all_res(8,:),'m-','LineWidth',1.1);
% %   plot(all_res(9,:),'b-','LineWidth',1.1);
% % plot(all_res(1,:),'-- ','LineWidth',2,'Color','#63B2EE');
% % plot(all_res(2,:),'-- ','LineWidth',2,'Color','#76da91 ');
% % plot(all_res(3,:),'-- ','LineWidth',2,'Color','#f8cb7f ');
% % plot(all_res(4,:),'-- ','LineWidth',2,'Color','#f89588 ');
% % plot(all_res(5,:),'-- ','LineWidth',2,'Color','#7cd6cf');
% % plot(all_res(6,:),'LineWidth',2,'Color','#7cd6cf ');
% % plot(all_res(7,:),'LineWidth',2,'Color','#eddd86   ');
% % plot(all_res(8,:),'LineWidth',2,'Color','#ffa510  ');
% % plot(all_res(9,:),'LineWidth',2,'Color','#3b6291  ');
%     plot(pre4,'-','LineWidth',1,'Color','#0072BD')
%     plot(pre2,':','LineWidth',1,'Color','#D95319')
%     plot(pre8,'m-','LineWidth',1)
%     plot(pre6,'c-','LineWidth',1)
%     plot(pre12,'g-','LineWidth',1)
%     plot(pre10,'b-','LineWidth',1)
%     plot(pre14,'-','LineWidth',1,'Color','#2F4F4F')
%     plot(pre16,'-','LineWidth',1,'Color','#8B4513')
%     plot(pre18,'r-','LineWidth',3)
%      plot(data1,'k-','LineWidth',2)
% set(gca,'FontName','Times New Roman','FontSize',20)
% set(gca,'xtick',[0:10:140])
% set(gca,'ytick',[]);
% xlim([50 60])