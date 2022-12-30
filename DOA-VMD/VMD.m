% 变分模式分解
function [u, u_hat, omega] = VMD(signal, alpha, tau, K, DC, init, tol)
% 信号 - 要分解的时域信号（1D）
% alpha - 数据保真约束的平衡参数
% tau - 双重上升的时间步长（选择0表示噪音松弛）
% K - 要恢复的模式数量
% DC - 如果第一种模式被放置并保持在DC（0-freq），则返回true
% init - 0 =所有omegas从0开始
% 1 =所有的omegas开始均匀分布
% 2 =所有omegas随机初始化收敛准则的
% tol - 容忍度;通常在1e-6左右
% 输出：
% -------
% u - 分解模式的集合
% u_hat - 模式的频谱
% ω - 估计的模式中心频率
% 使用此代码时，请引用我们的论文：
% -----------------------------------------------
% K. Dragomiretskiy，D.Zosso，Variational Mode Decomposition，IEEE Trans。信号处理（印刷中）
% 请在这里查看更新参考：
% http://dx.doi.org/10.1109/TSP.2013.2288675

% 周期和输入信号的采样频率
save_T = length(signal);
fs = 1/save_T;

% 通过镜像扩展信号
T = save_T;
f_mirror(1:T/2) = signal(T/2:-1:1);
f_mirror(T/2+1:3*T/2) = signal;
f_mirror(3*T/2+1:2*T) = signal(T:-1:T/2+1);
f = f_mirror;

% 时域从0到T（镜像信号）
T = length(f);
t = (1:T)/T;

% 谱域离散化
freqs = t-0.5-1/T;

% 最大迭代次数（如果尚未收敛，则不是）
N = 500;
% For future generalizations: individual alpha for each mode 为了将来的推广：每个模式的个人阿尔法
Alpha = alpha*ones(1,K);

% Construct and center f_hat 构建和中心化 f_hat
f_hat = fftshift((fft(f)));
f_hat_plus = f_hat;
f_hat_plus(1:T/2) = 0;

% matrix keeping track of every iterant // could be discarded for mem 每次迭代的矩阵跟踪//可以人为舍弃
u_hat_plus = zeros(N, length(freqs), K);

% omega_k的初始化
omega_plus = zeros(N, K);
switch init
    case 1
        for i = 1:K
            omega_plus(1,i) = (0.5/K)*(i-1);
        end
    case 2
        omega_plus(1,:) = sort(exp(log(fs) + (log(0.5)-log(fs))*rand(1,K)));
    otherwise
        omega_plus(1,:) = 0;
end

% if DC mode imposed, set its omega to 0 如果施加DC模式，则将其omega设置为0
if DC
    omega_plus(1,1) = 0;
end

% start with empty dual variables 从空双变量开始
lambda_hat = zeros(N, length(freqs));

% other inits 其他inits
uDiff = tol+eps; % 更新步骤
n = 1;           % 循环计数器
sum_uk = 0;      % 累加器

% -----------主循环用于迭代更新

while ( uDiff > tol &&  n < N )  % not converged and below iterations limit 没有收敛，低于迭代限制
    % update first mode accumulator 更新第一模式累加器
    k = 1;
    sum_uk = u_hat_plus(n,:,K) + sum_uk - u_hat_plus(n,:,1);
    
    % update spectrum of first mode through Wiener filter of residuals 通过残差的维纳滤波器更新第一模式的频谱
    u_hat_plus(n+1,:,k) = (f_hat_plus - sum_uk - lambda_hat(n,:)/2)./(1+Alpha(1,k)*(freqs - omega_plus(n,k)).^2);
    
    % update first omega if not held at 0 更新第一个欧米茄，如果不是在0
    if ~DC
        omega_plus(n+1,k) = (freqs(T/2+1:T)*(abs(u_hat_plus(n+1, T/2+1:T, k)).^2)')/sum(abs(u_hat_plus(n+1,T/2+1:T,k)).^2);
    end
    
    % update of any other mode 更新任何其他模式
    for k=2:K
        
        % accumulator 累加器
        sum_uk = u_hat_plus(n+1,:,k-1) + sum_uk - u_hat_plus(n,:,k);
        
        % mode spectrum 模式频谱
        u_hat_plus(n+1,:,k) = (f_hat_plus - sum_uk - lambda_hat(n,:)/2)./(1+Alpha(1,k)*(freqs - omega_plus(n,k)).^2);
        
        % center frequencies 中心频率
        omega_plus(n+1,k) = (freqs(T/2+1:T)*(abs(u_hat_plus(n+1, T/2+1:T, k)).^2)')/sum(abs(u_hat_plus(n+1,T/2+1:T,k)).^2);
        
    end
    
    % Dual ascent 双重上升
    lambda_hat(n+1,:) = lambda_hat(n,:) + tau*(sum(u_hat_plus(n+1,:,:),3) - f_hat_plus);
    
    % loop counter 循环计数器
    n = n+1;
    
    % converged yet? 收敛了吗？
    uDiff = eps;
    for i=1:K
        uDiff = uDiff + 1/T*(u_hat_plus(n,:,i)-u_hat_plus(n-1,:,i))*conj((u_hat_plus(n,:,i)-u_hat_plus(n-1,:,i)))';
    end
    uDiff = abs(uDiff);
    
end

%------后处理和清理
% discard empty space if converged early 如果早期收敛，则丢弃空白空间
N = min(N,n);
omega = omega_plus(1:N,:);

% Signal reconstruction 信号重建
u_hat = zeros(T, K);
u_hat((T/2+1):T,:) = squeeze(u_hat_plus(N,(T/2+1):T,:));
u_hat((T/2+1):-1:2,:) = squeeze(conj(u_hat_plus(N,(T/2+1):T,:)));
u_hat(1,:) = conj(u_hat(end,:));

u = zeros(K,length(t));

for k = 1:K
    u(k,:)=real(ifft(ifftshift(u_hat(:,k))));
end

% remove mirror part 去除镜像部分
u = u(:,T/4+1:3*T/4);

% recompute spectrum 重新计算频谱
clear u_hat;
for k = 1:K
    u_hat(:,k)=fftshift(fft(u(k,:)))';
end

end