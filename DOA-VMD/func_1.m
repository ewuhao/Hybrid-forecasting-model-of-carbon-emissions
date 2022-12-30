% 适应度函数
function F=func_1(x)
% 函数功能：计算该个体对应适应度值
% x           input     个体
% fitness     output    个体适应度值

% load ww12.TXT;
% a=ww12';
load('carbon_china.mat');
f = carbon_china;


% some sample parameters for VMD
alpha = ceil(x(1));        % moderate bandwidth constraint
tau = 0.3;            % noise-tolerance (no strict fidelity enforcement)
K = ceil(x(2));              % 3 modes
DC = 0;             % no DC part imposed
init = 1;           % initialize omegas uniformly
tol = 1e-7;

%--------------- Run actual VMD code

[u, u_hat, omega] = VMD(f, alpha, tau, K, DC, init, tol);


% AU=zeros(1,4096) ;
for kk =1:ceil(x(2))
%     AU = AU+u(kk,:);
    data=u(kk,:);
    scale=1;
    r=0.15;
    Fitness(kk) = MFE(data,scale,r) ;
    
    clear data
end
clear u u_hat omega c Y E1 


F = min(Fitness);




 
%网络输出反归一化
% F=ort2;


