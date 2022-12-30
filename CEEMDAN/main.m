clc
clear
close all

% load('water.mat')
% data_ori = water;
% data_ori =xlsread( 'C:\Users\15503\Desktop\IMF45.xlsx ');
% data_ori=data_ori'
 data_ori=signal;
fs=1000;

Nstd = 0.01;
NR =500;
MaxIter = 5000;
% [a,b]=size(ship1);    
[ceemdan_imf,its] = ceemdan(data_ori,Nstd,NR,MaxIter);
save('ceemdan_imf.mat', 'ceemdan_imf') 

%% 显示分解结果

imf=ceemdan_imf;
[a, b]=size(imf);
figure(1);
for i=1:1:a-1
    subplot(a,1,i);
    plot(imf(i,:));
    ylabel (['imf ' num2str(i)]);
    xlim([0 1000])
    set(gca,'xtick',[])
    set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',16);
    set(gca,'FontName','Times New Roman','fontsize',14);%刻度的大小
end;
subplot(a,1,a)
set(gcf,'color','w')
plot(imf(a,:));
xlabel('n')
ylabel (['imf ' num2str(a)]);
xlim([0 1000]);
set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize',16);
set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize',16);
set(gca,'FontName','Times New Roman','fontsize',14);%刻度的大小



% figure
% ha = tight_subplot(a,1,[.01 .01],[.1 .04],[.1 .03]);
% for i=1:a
% axes(ha(i)); 
% %% FFT 变换
% [cc,y_f]=hua_fft(imf(i,:),fs,1);
% plot(y_f,cc,'b','LineWIdth',0.5);
% % hua_fft(u(i,:),fs,1)
% ylabel(['IMF',num2str(i)],'fontsize',10,'FontName','Times New Roman');
% axis tight
% end
% xlabel('Frequency','fontsize',10,'FontName','Times New Roman')
figure(2);
N=1000;
for i=1:a
f3=(N/2:N-1)*fs/N-fs/2 ;%频率范围0Hz-25Hz
y2=abs(fftshift(fft(imf(i,:))));
y3=2*y2(N/2:N-1)/N;%幅值修正得到真实幅值
plot(f3,y3);
hold on;
end
xlabel('Frequency'); 
ylabel('Amplitude'); 
io=IO(data_ori,imf);
% figure();%比较重构波形的差别
% plot(data_ori,'r','linewidth',1.5);
% hold on
% ceemdan_lorenz_sum = sum( ceemdan_imf,1);
% plot(ceemdan_lorenz_sum,'b','linewidth',1);
% legend('原始信号','重构信号');
% xlim([0 2048])


