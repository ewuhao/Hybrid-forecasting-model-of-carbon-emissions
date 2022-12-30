clc;clear;close all;
%% 保存数据
%{
    save("Test_pre_ori.mat","Test_pre_ori") % 保存原始数据

    RBF_Pre = TEST_SIM;
    RBF_result = RESULT;
    save("RBF_Pre.mat","RBF_Pre")
    save("RBF_result.mat","RBF_result")

    LSTM_Pre = TEST_SIM;
    LSTM_result = RESULT;
    save("LSTM_Pre.mat","LSTM_Pre")
    save("LSTM_result.mat","LSTM_result")

    VMD_RBF_Pre = TEST_SIM;
    VMD_RBF_result = RESULT;
    save("VMD_RBF_Pre.mat","VMD_RBF_Pre")
    save("VMD_RBF_result.mat","VMD_RBF_result")

    VMD_LSTM_Pre = TEST_SIM;
    VMD_LSTM_result = RESULT;
    save("VMD_LSTM_Pre.mat","VMD_LSTM_Pre")
    save("VMD_LSTM_result.mat","VMD_LSTM_result")


% 等值赋权模型
    VMD_LSTM_Equal_RBF_Pre = TEST_SIM;
    VMD_LSTM_Equal_RBF_result = RESULT;
    save("VMD_LSTM_Equal_RBF_Pre.mat","VMD_LSTM_Equal_RBF_Pre")
    save("VMD_LSTM_Equal_RBF_result.mat","VMD_LSTM_Equal_RBF_result")

% 本文方法
    VMD_LSTM_IOWA_RBF_Pre = TEST_SIM;
    VMD_LSTM_IOWA_RBF_result = RESULT;
    save("VMD_LSTM_IOWA_RBF_Pre.mat","VMD_LSTM_IOWA_RBF_Pre")
    save("VMD_LSTM_IOWA_RBF_result.mat","VMD_LSTM_IOWA_RBF_result")

%}
%% 加载预测结果数据

% load('Test_pre_ori.mat')
% load('LSTM_Pre.mat')
% load('RBF_Pre.mat')
% load('VMD_RBF_Pre.mat')
% load('VMD_LSTM_Pre.mat')
% load('VMD_LSTM_Equal_RBF_Pre.mat')
% load('VMD_LSTM_IOWA_RBF_Pre.mat')
% 
% load('LSTM_result.mat')
% load('RBF_result.mat')
% load('VMD_RBF_result.mat')
% load('VMD_LSTM_result.mat')
% load('VMD_LSTM_Equal_RBF_result.mat')
% load('VMD_LSTM_IOWA_RBF_result.mat')

% Ori = Test_pre_ori(:)';
% Pre1 = RBF_Pre;
% Pre2 = LSTM_Pre;
% Pre3 = VMD_RBF_Pre;
% Pre4 = VMD_LSTM_Pre;
% Pre5 = VMD_LSTM_Equal_RBF_Pre;
% Pre6 = VMD_LSTM_IOWA_RBF_Pre;
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

%% VMD-LSTM和VMD-RBF
%{
    Test_pre1 = Pre3(:)';    % 测试集预测值
    Test_pre2 = Pre4(:)';    % 测试集预测值
    Test_ori = Ori(:)';      % 测试集原始值
    n = length(Test_ori);
    h1 = figure('Name', '测试集预测结果', 'NumberTitle', 'on');
	set(h1,'position',[403,345,576,301]);	% 403,246是左下角的横纵坐标，700为长度，400为高度
%     subplot(211)
    plot(Test_pre1,'r*-');
    hold on;plot(Test_pre2,'LineStyle','-','Marker','o','color','#FF00FF');
    hold on;plot(Test_ori,'b.-');

    xlim([1,length(Test_ori)]);
    legend({'MVMD-RBF','MVMD-LSTM','Actual Data'},'Location','northwest') % ,'NumColumns',3
%     title('Predicted value and Actual Data'); % title('预测值和真实值');
    xlabel('Sample points');
    ylabel('Amplitude')
    set(gca,'FontName','Times New Roman','fontsize', 12);	% 坐标轴刻度字体大小    
    set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize', 12);
    set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize', 12);
   	set(get(gca,'Legend'),'FontName','Times New Roman','FontSize', 12);
    % set(gca, 'box', 'off') % 去掉上边和右边的边框
    set(gca,'looseInset',[0 0 0 0]) % [左,下,右,上]，[0 0 0.01 0]表示左、下、上保留0%的空白区域，右边保存1%的空白 

%
%% 残差预测图

    h2 = figure('Name', '预测残差波形图', 'NumberTitle', 'on');
	set(h2,'position',[403,345,576,301]);	% 403,246是左下角的横纵坐标，700为长度，400为高度
	Refer_Axis = zeros(1,length(Test_ori));
    err_te1 = Test_ori-Test_pre1; % err_te波形看上去更直观
    err_te2 = Test_ori-Test_pre2; % err_te波形看上去更直观
  	
    plot(err_te1,'-r')
    hold on;plot(err_te2,'-b')
    hold on;plot(Refer_Axis,'k:','LineWidth',2)
    xlim([1,length(Test_ori)]);    
    legend({'MVMD-RBF Error sequence','MVMD-LSTM Error sequence'},'Location','northwest')
%     legend boxoff; % 图例不加方框
%     title('Residual error'); % title('残差');
    xlabel('n');
    ylabel('e(n)');
    ylim([min([min(err_te1),min(err_te2)])+0.1*min([min(err_te1),min(err_te2)]),...
        max([max(err_te1),max(err_te2)])+0.2*max([max(err_te1),max(err_te2)])])
    set(gca,'FontName','Times New Roman','FontSize', 12);	% 坐标轴刻度字体大小    
    set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize', 12);
    set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize', 12);
    set(get(gca,'Legend'),'FontName','Times New Roman','FontSize', 12);
    % set(gca, 'box', 'off') % 去掉上边和右边的边框 
	set(gca,'looseInset',[0 0 0 0]) % [左,下,右,上]，[0 0 0.01 0]表示左、下、上保留0%的空白区域，右边保存6.5%的空白 
    num = sum(((err_te1>0) + (err_te2<0) == 2) + (((err_te1<0) + (err_te2>0)) == 2))/n
%}

%% 模型对比


    % 预测结果
    h4 = figure('Name', '模型对比图', 'NumberTitle', 'on');
% 	set(h4,'position',[293,77,944,521]);	% 81,237是左下角的横纵坐标，868,432分别是为长度和高度
    %hold on, plot(pre1,'-.','LineWidth',1,'Color','#0072BD')
%     hold on, plot(pre3,':','LineWidth',1,'Color','#D95319')
     hold on, plot(pre18, 'b','LineWidth',4)
%    hold on, plot(pre7,'c-*','LineWidth',1)
%     hold on, plot(pre5,'g-+','LineWidth',1)
%     hold on, plot(pre6,'b-o','LineWidth',1)
    plot(data1,'r-','LineWidth',4)
    legend('DVMD-NNetEn-CEEMDAN-HPOBP-AVOALSSVM-EC','Actual data');

    % 设置 Axes 属性
        af = gcf; % 返回当前图窗的句柄。如果图窗不存在，则 gcf 将创建一个图窗并返回其句柄。
        ax = gca; % 返回当前图窗的当前坐标区或图，这通常是最后创建的图窗或用鼠标点击的最后一个图窗
        % 总体设置
            ax.LooseInset =[0 0 0 0];           % [左,下,右,上]，[0 0 0.01 0]表示左、下、上保留0%的空白区域，右边保存1%的空白
            ax.FontName = 'Times New Roman';    % 设置整个坐标区的字体名称
            ax.FontSize = 25;                   % 设置整个坐标区的字体大小
            ax.Box = 'off';                     % 设置框轮廓，去掉上边和右边的边框
            
            af.Units = 'pixels';
%             af.Position = [100,100,576,301];
        % 坐标轴设置
            ax.YLabel.String = 'Carbon emissions(mt)';
            ax.YLabel.FontName = 'Times New Roman';
            ax.YLabel.FontSize = 25;          %  设置Y坐标轴标签字体大小
            ax.YLim = [min([min(data1),min(data1)])-0.5*min([min(data1),min(data1)]),...
                       max([max(data1),max(data1)])+0.34*max([max(data1),max(data1)])];	% 设置标尺，Y坐标轴最小和最大范围
            
            
            ax.XLabel.String = 'Sample points';
            ax.XLabel.FontName = 'Times New Roman';
            ax.XLabel.FontSize = 25;          %  设置X坐标轴标签字体大小
            ax.XLim = [1,length(data1)];	% 设置标尺，X坐标轴最小和最大范围

      	% Legend 属性设置
            ax.Legend.FontName = 'Times New Roman';
            ax.Legend.FontSize = 25;                  % 字体大小
            ax.Legend.TextColor = 'black';              % 文本颜色
%             ax.Legend.Location = 'northwest';                % 相对于坐标区的位置
%             ax.Legend.NumColumns = 3;                   % 列数
            % ax.Legend.Box = 'on';                      % 不显示框轮廓，等价于：legend boxoff; % 图例不加方框

            


    



%% 模型预测误差分布

%中国误差
%     h6 = figure('Name', '模型预测误差分布', 'NumberTitle', 'on');
% 	set(h6,'position',[100,100,576,301]);	% 100,100是左下角的横纵坐标，576,301分别是为长度和高度
%     Refer_Axis = zeros(1,length(data));
%     Err1 = data-pre1;
%     Err2 = data-pre3;
%     Err3 = data-pre5;
%     Err4 = data-pre7;
%     Err5 = data-pre9;
%     Err6 = data-pre11;
%     Err7 = data-pre13;
%     Err8 = data-pre15;
%     Err9 = data-pre17;
%     hold on, plot(Err1,'-','LineWidth',1,'Color','#0072BD')
%     hold on, plot(Err2,':','LineWidth',1,'Color','#D95319')
%     hold on, plot(Err3,'m-','LineWidth',1)
%     hold on, plot(Err4,'c-','LineWidth',1)
%     hold on, plot(Err5,'g-','LineWidth',1)
%     hold on, plot(Err6,'b-','LineWidth',1)
% %     hold on, plot(Err7,'z-','LineWidth',1)
%     hold on, plot(Err7,'-','LineWidth',1,'Color','#2F4F4F')
% %     hold on, plot(Err8,'y-','LineWidth',1)
%      hold on, plot(Err8,'-','LineWidth',1,'Color','#8B4513')
%     hold on, plot(Err9,'r-','LineWidth',1)
%     hold on, plot(Refer_Axis,'k-','LineWidth',2)
%     xlim([1,length(data)]);  
%     set(gcf,'unit','normalized','position',[0.013,0.244791666666667,0.517014641288433,0.527208333333333]);
%     legend({'M2','M1','M4','M3','M6','M5','M7','M8','M9'},... % ,'Zeros level'
%         'Location','northwest','NumColumns',3)
%     
%     xlabel('Sample points')
%     ylabel('Amplitude')
%     ylim([-6 5]);
%     set(gca,'FontName','Times New Roman','FontSize', 12);	% 坐标轴刻度字体大小    
%     set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize', 12);
%     set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize', 12);
%     set(get(gca,'Legend'),'FontName','Times New Roman','FontSize', 10);
%     
%     set(gca,'looseInset',[0 0 0 0]) % [左,下,右,上]，[0 0 0.01 0]表示左、下、上保留0%的空白区域，右边保存7.9%的空白
%     %% 预测结果局部放大图
% 
%     
%     h6 = figure('Name', '后70个点局部放大图', 'NumberTitle', 'on');
% 	set(h6,'position',[100,100,576,301]);	% 81,237是左下角的横纵坐标，868,432分别是为长度和高度
%     range = length(pre1)-70:length(pre1);
%     
%     hold on, plot(range,pre1(1,range),'-.','LineWidth',1,'Color','#0072BD')
%     hold on, plot(range,pre2(1,range),':','LineWidth',1,'Color','#D95319')
%     hold on, plot(range,pre3(1,range), 'm--.','LineWidth',1)
%     hold on, plot(range,pre4(1,range),'c-*','LineWidth',1)
%     hold on, plot(range,pre5(1,range),'g-+','LineWidth',1)
%     hold on, plot(range,pre6(1,range),'b-o','LineWidth',1)
%     plot(range,Ori(1,range),'r-','LineWidth',2)
%     
%     set(gcf,'unit','normalized','position',[0.186,0.161,0.67,0.573]);
%     legend({'RBF','LSTM','MVMD-RBF','MVMD-LSTM','MVMD-LSTM-Equal-RBF','MVMD-LSTM-IOWA-RBF','Actual Data'},...
%         'Location','northwest','NumColumns',3)
%     xlabel('Sample points')
%     ylabel('Amplitude')
%     ylim([min([min(Ori),min(Ori)])-0.1*min([min(Ori),min(Ori)]),...
%                max([max(Ori),max(Ori)])+0.42*max([max(Ori),max(Ori)])])
%     set(gca,'FontName','Times New Roman','FontSize', 12);	% 坐标轴刻度字体大小    
%     set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize', 12);
%     set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize', 12);
%     set(get(gca,'Legend'),'FontName','Times New Roman','FontSize', 10);
%     set(gca,'looseInset',[0 0 0 0]) % [左,下,右,上]，[0 0 0.01 0]表示左、下、上保留0%的空白区域，右边保存7.9%的空白
%俄罗斯误差
% h6 = figure('Name', '模型预测误差分布', 'NumberTitle', 'on');
% 	set(h6,'position',[100,100,576,301]);	% 100,100是左下角的横纵坐标，576,301分别是为长度和高度
%     Refer_Axis = zeros(1,length(data1));
%     Err1 = data1-pre2;
%     Err2 = data1-pre4;
%     Err3 = data1-pre6;
%     Err4 = data1-pre8;
%     Err5 = data1-pre10;
%     Err6 = data1-pre12;
%     Err7 = data1-pre14;
%     Err8 = data1-pre16;
%     Err9 = data1-pre18;
%     hold on, plot(Err1,'-','LineWidth',1,'Color','#0072BD')
%     hold on, plot(Err2,':','LineWidth',1,'Color','#D95319')
%     hold on, plot(Err3,'m-','LineWidth',1)
%     hold on, plot(Err4,'c-','LineWidth',1)
%     hold on, plot(Err5,'g-','LineWidth',1)
%     hold on, plot(Err6,'b-','LineWidth',1)
% %     hold on, plot(Err7,'z-','LineWidth',1)
%     hold on, plot(Err7,'-','LineWidth',1,'Color','#2F4F4F')
% %     hold on, plot(Err8,'y-','LineWidth',1)
%      hold on, plot(Err8,'-','LineWidth',1,'Color','#8B4513')
%     hold on, plot(Err9,'r-','LineWidth',1)
%     hold on, plot(Refer_Axis,'k-','LineWidth',2)
%     xlim([1,length(data1)]);  
%     set(gcf,'unit','normalized','position',[0.013,0.244791666666667,0.517014641288433,0.527208333333333]);
%     legend({'M2','M1','M4','M3','M6','M5','M7','M8','M9'},... % ,'Zeros level'
%         'Location','northwest','NumColumns',3)
%     
%     xlabel('Sample points')
%     ylabel('Amplitude')
%     ylim([-1 1.2]);
%     set(gca,'FontName','Times New Roman','FontSize', 12);	% 坐标轴刻度字体大小    
%     set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize', 12);
%     set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize', 12);
%     set(get(gca,'Legend'),'FontName','Times New Roman','FontSize', 10);
%     
%     set(gca,'looseInset',[0 0 0 0]) % [左,下,右,上]，[0 0 0.01 0]表示左、下、上保留0%的空白区域，右边保存7.9%的空白

%% 预测误差箱线图

%{
    h7 = figure('Name', '预测误差箱线图', 'NumberTitle', 'on');
	set(h7,'position',[100,100,290,290]);	% 81,237是左下角的横纵坐标，868,432分别是为长度和高度
    Err1 = Ori-Pre1;
    Err2 = Ori-Pre2;
    Err3 = Ori-Pre3;
    Err4 = Ori-Pre4;
    Err5 = Ori-Pre5;
    Err6 = Ori-Pre6;
    x1 = [Err1;Err2;Err3;Err4;Err5;Err6]'; % ;Err6;Err7;Err8;Err9;Err10
    boxplot(x1,'BoxStyle' ,'outline',... - 箱子样式：使用带虚须线的空心箱绘制箱子，如果 'PlotStyle' 是 'traditional'，则默认值为'outline'
        'Colors', 'rgbymc',... - 箱子颜色：比如'rb' 会交替显示红色和蓝色的箱子
        'MedianStyle','target',...- 中位数样式：绘制带黑心的圆来表示每个箱子的中位数。如果 'PlotStyle' 是 'traditional'，则默认值为'line'(画一条线来表示每个箱子中的中位数)
        'Notch','off',...- 比较区间的标记：省略比较区间
        'OutlierSize',6,... - 离群值的标记大小：如果 'PlotStyle' 是 'traditional'，则默认值为 6
        'PlotStyle', 'traditional',...- 绘图样式：使用传统箱子样式绘制箱子。
        'Symbol', 'k+',...- 离群值的符号和颜色：如果 'PlotStyle' 是 'traditional'，则默认值为 'r+'，它使用红色 '+' 符号绘制每个离群值。
                   	  ... - 如果省略符号，则离群值不可见。如果省略颜色，则离群值将以与箱子相同的颜色出现。
      	'Widths',0.5,...  - 箱子宽度，此名称-值对组参数不会更改箱子之间的间距，默认箱子宽度等于箱子间最小间距的一半，即 0.5。
        'Labels',{'M1','M2','M3','M4','M5','M6'}) % - 箱子标签
    set(gca,'FontName','Times New Roman','fontsize', 12);	% 设置文字大小，同时影响坐标轴标注、图例、标题等。 
    set(get(gca,'YLabel'),'FontName','Times New Roman','FontSize', 12);
    set(get(gca,'XLabel'),'FontName','Times New Roman','FontSize', 12);
    % set(get(gca,'Legend'),'FontName','Times New Roman','FontSize', 12);
    % set(gca, 'box', 'off') % 去掉上边和右边的边框
    set(gca,'looseInset',[0 0 0 0]) % [左,下,右,上]，[0 0 0.01 0]表示左、下、上保留0%的空白区域，右边保存1%的空白 
    
    
%         h=gca;  %获取句柄
%         h.XTickLabelRotation=30; % 标签选择30度，参考资料：https://www.ilovematlab.cn/forum.php?mod=viewthread&tid=493906&extra=page%3D1&page=1
%         set(gca,'XTickLabel',{' '}) % 从绘图中删除标签
    
%
%% 预测指标三角框图
%
    h7 = figure('Name', '预测指标三角框图', 'NumberTitle', 'on');
    reu1t(1,:) = RBF_result;
    reu1t(2,:) = LSTM_result;
    reu1t(3,:) = VMD_RBF_result;
    reu1t(4,:) = VMD_LSTM_result;
    reu1t(5,:) = VMD_LSTM_Equal_RBF_result;
    reu1t(6,:) = VMD_LSTM_IOWA_RBF_result;
    reu1t(:,1:4) % 查看前4个指标
 	data = reu1t(:,1:3);
        
    clor = 'rgbymc';
% ************************数据归一化************************

    [M_num, N_num] = size(data); % M_num：模型个数；N_num：指标个数
    for i = 1:N_num
        index = data(:,i); % 取所有模型的第一个指标
        % min_ind(i) = min(index); % 指标最小值
        max_ind(i) = max(index);  % 指标最大值
        n_max(i) = floor(max_ind(i))+2;
        % data_x = index(:)';                          % 转化为行向量（归一化函数的输入数据必须是行向量）
        % [index_n, PS]=mapminmax(data_x, min_ind(i)/n_max(i), max_ind(i)/n_max(i));	% index_n 是归一化的输出数据（行向量）
        % data_n(:,i) = index_n(:);
    end
% ************************绘图************************
    theta_i = [90 225 315];
    for i = 1:M_num
        index = data(i,:);
        polarplot([theta_i(2),	theta_i(1),	theta_i(3),	theta_i(2)]/180*pi,...
                  [index(1),	index(2),	index(3),	index(1)],...
             clor(i),'LineWidth',1.5, 'LineStyle','-')
        hold on
    end
    legend({'M1','M2','M3','M4','M5','M6'},... % ,'Zeros level'
            'Location','northwest','NumColumns',1)
% ************************Figure 属性************************

    f = gcf;
    f.Position  = [100,100,290,290]; % - 可绘制区域的位置和大小
% ************************Line属性************************
    % p.Color = 'magenta'; % - 线条颜色
    % p.LineStyle = '-'; %  - 线型
    % p.LineWidth = 0.5; % - 线条宽度
    % p.Marker = '.'; % - 标记符号
    % p.MarkerSize = 6; % - 标记大小
    % p.MarkerFaceColor = 'none'; % - 标记填充颜色
    % thetalim([0 360])
% ************************PolarAxes属性************************
num = 4; % 基准线个数
ax = gca;
% 字体
    ax.FontName = 'Times New Roman'; % - 字体名称
    ax.FontSize = 12; %  - 字体大小，影响标题（110%）、刻度标签（100%）、图例或颜色栏（90%）。
% 刻度
    rL=rlim;
%     thetaL=thetalim;
    
    r_i = [];
    for i = rL(1):rL(2)/num:rL(2)
        r_i = [r_i,i];
    end

 
    ax.RTick = r_i; % - 半径刻度值，控制圆环线的个数    
    ax.ThetaTick = theta_i; % - 线条角刻度值，控制角度线的个数
    
% 刻度标签
    r_change = [];
    for i = 0:num
        r_change = [r_change,{num2str(max(n_max)*i/num,'%.1f')}];
    end
    theta_change = {'RMSE','MAE','MAPE'};

    ax.RTickLabel = r_change; % - 半径刻度标签
    ax.ThetaTickLabel = theta_change; %  - 线条的标签
    
    ax.TickLength = [0.02 1]; % 设置次刻度线长度
    ax.RMinorTick = 'on'; %  - 圆环线之间的次刻度线（角度线上的次刻度线）
    ax.ThetaMinorTick = 'on'; % - 角度线之间的次刻度线（圆环线上的次刻度线）
    ax.TickDir = 'out'; % - 刻度线方向
% 标尺
%     ax.RLim = [1 5]; % - 圆环线的最小和最大半径范围
    ax.RColor = 'k'; % - r 轴的颜色(圆环线)
    ax.ThetaColor = 'k'; %  - theta 轴的颜色（角度线）
% 网格线
    ax.RGrid = 'on'; % - 显示 r 轴网格线
    ax.ThetaGrid = 'on'; % - 显示 theta 轴网格线
    ax.GridLineStyle = '-'; % - 网格线的线型
    
    ax.RMinorGrid = 'off'; % - 显示 r 轴次网格线
    ax.ThetaMinorGrid = 'off'; % - 显示 theta 轴次网格线
    ax.MinorGridLineStyle = ':'; % - 次网格线的线型
% 框样式
    ax.LineWidth = 1; % - 圆环线和角度线的宽度
    ax.Box = 'on'; % - 极坐标区周围的轮廓
% 位置
    ax.Units = 'normalized';%- 位置单位    
    % ax.Position = [0 0 1 1]; % - 极坐标区的尺寸和位置，不包括标签或边距
    set(gca,'looseInset',[0.066,0.078,0.078,0.078]) % [左,下,右,上]，[0 0 0.01 0]表示左、下、上保留0%的空白区域，右边保存1%的空白（这里按自己的需求进行设置）


%}   




% MAPE、RMSE、MAE直方图

% 
%         h8 = figure('Name', '预测误差箱线图', 'NumberTitle', 'on');
%         set(h8,'position',[212,150,479,409]);	% 81,237是左下角的横纵坐标，868,432分别是为长度和高度
% 
% %         load('LSTM_result.mat')
% %         load('RBF_result.mat')
% %         load('VMD_RBF_result.mat')
% %         load('VMD_LSTM_result.mat')
% %         load('VMD_LSTM_Equal_RBF_result.mat')
% %         load('VMD_LSTM_IOWA_RBF_result.mat')
%           load('zhibiao.mat');
% 
%         reu1t1 = zhibiao(1,:);
%         reu1t2 = zhibiao(2,:);
%         reu1t3 = zhibiao(3,:);
%         reu1t4 = zhibiao(4,:);
%         reu1t5 = zhibiao(5,:);
%         reu1t6 = zhibiao(6,:);
%         reu1t7 = zhibiao(7,:);
%         reu1t8 = zhibiao(8,:);
%         reu1t9 = zhibiao(9,:);
%         T1 = table(reu1t1(1), reu1t1(2), reu1t1(3), reu1t1(4),...	% 表格的成员变量
%                 'VariableNames',{'RMSE','MAE','MAPE','R2'})	% 指定变量名称        
%         T2 = table(reu1t2(1), reu1t2(2), reu1t2(3), reu1t2(4),...	% 表格的成员变量
%                 'VariableNames',{'RMSE','MAE','MAPE','R2'})% 指定变量名称        
%         T3 = table(reu1t3(1), reu1t3(2), reu1t3(3), reu1t3(4),...	% 表格的成员变量
%                 'VariableNames',{'RMSE','MAE','MAPE','R2'})	% 指定变量名称        
%         T4 = table(reu1t4(1), reu1t4(2), reu1t4(3), reu1t4(4),...	% 表格的成员变量
%                 'VariableNames',{'RMSE','MAE','MAPE','R2'})% 指定变量名称        
%         T5 = table(reu1t5(1), reu1t5(2), reu1t5(3), reu1t5(4),...	% 表格的成员变量
%                 'VariableNames',{'RMSE','MAE','MAPE','R2'})	% 指定变量名称        
%         T6 = table(reu1t6(1), reu1t6(2), reu1t6(3), reu1t6(4),...	% 表格的成员变量
%                 'VariableNames',{'RMSE','MAE','MAPE','R2'})% 指定变量名称  
%         T7 = table(reu1t7(1), reu1t7(2), reu1t7(3), reu1t7(4),...	% 表格的成员变量
%                 'VariableNames',{'RMSE','MAE','MAPE','R2'})% 指定变量名称  
%         T8 = table(reu1t8(1), reu1t8(2), reu1t8(3), reu1t8(4),...	% 表格的成员变量
%                 'VariableNames',{'RMSE','MAE','MAPE','R2'})% 指定变量名称  
%         T9 = table(reu1t9(1), reu1t9(2), reu1t9(3), reu1t9(4),...	% 表格的成员变量
%                 'VariableNames',{'RMSE','MAE','MAPE','R2'})% 指定变量名称  
%     y = [T1.RMSE, T1.MAE, T1.MAPE,T1.R2 ;...
%          T2.RMSE, T2.MAE, T2.MAPE,T2.R2 ;... 
%          T3.RMSE, T3.MAE, T3.MAPE,T3.R2 ;... 
%          T4.RMSE, T4.MAE, T4.MAPE,T4.R2 ;...
%          T5.RMSE, T5.MAE, T5.MAPE,T5.R2 ;...
%          T6.RMSE, T6.MAE, T6.MAPE,T6.R2 ;...
%          T7.RMSE, T7.MAE, T7.MAPE,T7.R2 ;...
%          T8.RMSE, T8.MAE, T8.MAPE,T8.R2 ;...
%          T9.RMSE, T9.MAE, T9.MAPE,T9.R2 ;];
%      x = categorical({'M1','M2','M3','M4','M5','M6','M7','M8','M9'});
%      x = reordercats(x,{'M1','M2','M3','M4','M5','M6','M7','M8','M9'});
%     bar(x,y)
%     
%     legend({'MAPE','RMSE','MAE','R2'},'Location','best')
%     set(gca,'FontSize',20); % 设置文字大小，同时影响坐标轴标注、图例、标题等。    
%     set(gca, 'box', 'off') % 去掉上边和右边的边框
%     set(gca,'looseInset',[0 0 0 0]) % [左,下,右,上]，[0 0 0.01 0]表示左、下、上保留0%的空白区域，右边保存0%的空白 




%% DM检验

%{
actual_lst = Test_pre_ori;
% DM_stat = zeros(6);
% p_value = zeros(6);
for i = 1:6
	filename1 = ['= Pre',num2str(i,'%d')]; % 对比模型
    eval( ['pred1_lst',filename1]); % 将字符串转换为变量，并赋值
    for j = 1:6
        filename2 = ['= Pre',num2str(j,'%d')]; % 目标模型
        eval( ['pred2_lst',filename2]);
        [DM_stat1(j,i), p_value1(j,i)] = DM_Test(actual_lst,pred1_lst,pred2_lst, 1, "MSE");
        [DM_stat2(j,i), p_value2(j,i)] = DM_Test(actual_lst,pred1_lst,pred2_lst, 1, "MAD");
        [DM_stat3(j,i), p_value3(j,i)] = DM_Test(actual_lst,pred1_lst,pred2_lst, 1, "MAPE");
        [DM_stat4(j,i), p_value4(j,i)] = DM_Test(actual_lst,pred1_lst,pred2_lst, 1, "poly");
        [DM_stat5(j,i), p_value5(j,i)] = DM_Test1(actual_lst,pred1_lst,pred2_lst, 1, "MSE");
        [DM_stat6(j,i), p_value6(j,i)] = DM_Test1(actual_lst,pred1_lst,pred2_lst, 1, "MAD");
        [DM_stat7(j,i), p_value7(j,i)] = DM_Test1(actual_lst,pred1_lst,pred2_lst, 1, "MAPE");
        [DM_stat8(j,i), p_value8(j,i)] = DM_Test1(actual_lst,pred1_lst,pred2_lst, 1, "poly");
  
    end
end

%}

% plot(pred1_lst)
% hold on
% plot(pred2_lst)
