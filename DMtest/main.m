clear all
clc

% load('errship_b.mat')%加载的数据是所有模型的预测结果，最后一列是你提出模型的预测误差
err=xlsread('russia_err.xlsx');
dm=err;
dm1 = dm';

[m,n]=size(dm1);
dm=[];
p=[];
for i=1:8
    [DM,value]= dmtest(dm1(:,i), dm1(:,9));
    dm=[dm;DM];
    p=[p,value];
    
end
dm
p