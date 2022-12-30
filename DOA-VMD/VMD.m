% ���ģʽ�ֽ�
function [u, u_hat, omega] = VMD(signal, alpha, tau, K, DC, init, tol)
% �ź� - Ҫ�ֽ��ʱ���źţ�1D��
% alpha - ���ݱ���Լ����ƽ�����
% tau - ˫��������ʱ�䲽����ѡ��0��ʾ�����ɳڣ�
% K - Ҫ�ָ���ģʽ����
% DC - �����һ��ģʽ�����ò�������DC��0-freq�����򷵻�true
% init - 0 =����omegas��0��ʼ
% 1 =���е�omegas��ʼ���ȷֲ�
% 2 =����omegas�����ʼ������׼���
% tol - ���̶�;ͨ����1e-6����
% �����
% -------
% u - �ֽ�ģʽ�ļ���
% u_hat - ģʽ��Ƶ��
% �� - ���Ƶ�ģʽ����Ƶ��
% ʹ�ô˴���ʱ�����������ǵ����ģ�
% -----------------------------------------------
% K. Dragomiretskiy��D.Zosso��Variational Mode Decomposition��IEEE Trans���źŴ���ӡˢ�У�
% ��������鿴���²ο���
% http://dx.doi.org/10.1109/TSP.2013.2288675

% ���ں������źŵĲ���Ƶ��
save_T = length(signal);
fs = 1/save_T;

% ͨ��������չ�ź�
T = save_T;
f_mirror(1:T/2) = signal(T/2:-1:1);
f_mirror(T/2+1:3*T/2) = signal;
f_mirror(3*T/2+1:2*T) = signal(T:-1:T/2+1);
f = f_mirror;

% ʱ���0��T�������źţ�
T = length(f);
t = (1:T)/T;

% ������ɢ��
freqs = t-0.5-1/T;

% �����������������δ���������ǣ�
N = 500;
% For future generalizations: individual alpha for each mode Ϊ�˽������ƹ㣺ÿ��ģʽ�ĸ��˰�����
Alpha = alpha*ones(1,K);

% Construct and center f_hat ���������Ļ� f_hat
f_hat = fftshift((fft(f)));
f_hat_plus = f_hat;
f_hat_plus(1:T/2) = 0;

% matrix keeping track of every iterant // could be discarded for mem ÿ�ε����ľ������//������Ϊ����
u_hat_plus = zeros(N, length(freqs), K);

% omega_k�ĳ�ʼ��
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

% if DC mode imposed, set its omega to 0 ���ʩ��DCģʽ������omega����Ϊ0
if DC
    omega_plus(1,1) = 0;
end

% start with empty dual variables �ӿ�˫������ʼ
lambda_hat = zeros(N, length(freqs));

% other inits ����inits
uDiff = tol+eps; % ���²���
n = 1;           % ѭ��������
sum_uk = 0;      % �ۼ���

% -----------��ѭ�����ڵ�������

while ( uDiff > tol &&  n < N )  % not converged and below iterations limit û�����������ڵ�������
    % update first mode accumulator ���µ�һģʽ�ۼ���
    k = 1;
    sum_uk = u_hat_plus(n,:,K) + sum_uk - u_hat_plus(n,:,1);
    
    % update spectrum of first mode through Wiener filter of residuals ͨ���в��ά���˲������µ�һģʽ��Ƶ��
    u_hat_plus(n+1,:,k) = (f_hat_plus - sum_uk - lambda_hat(n,:)/2)./(1+Alpha(1,k)*(freqs - omega_plus(n,k)).^2);
    
    % update first omega if not held at 0 ���µ�һ��ŷ���ѣ����������0
    if ~DC
        omega_plus(n+1,k) = (freqs(T/2+1:T)*(abs(u_hat_plus(n+1, T/2+1:T, k)).^2)')/sum(abs(u_hat_plus(n+1,T/2+1:T,k)).^2);
    end
    
    % update of any other mode �����κ�����ģʽ
    for k=2:K
        
        % accumulator �ۼ���
        sum_uk = u_hat_plus(n+1,:,k-1) + sum_uk - u_hat_plus(n,:,k);
        
        % mode spectrum ģʽƵ��
        u_hat_plus(n+1,:,k) = (f_hat_plus - sum_uk - lambda_hat(n,:)/2)./(1+Alpha(1,k)*(freqs - omega_plus(n,k)).^2);
        
        % center frequencies ����Ƶ��
        omega_plus(n+1,k) = (freqs(T/2+1:T)*(abs(u_hat_plus(n+1, T/2+1:T, k)).^2)')/sum(abs(u_hat_plus(n+1,T/2+1:T,k)).^2);
        
    end
    
    % Dual ascent ˫������
    lambda_hat(n+1,:) = lambda_hat(n,:) + tau*(sum(u_hat_plus(n+1,:,:),3) - f_hat_plus);
    
    % loop counter ѭ��������
    n = n+1;
    
    % converged yet? ��������
    uDiff = eps;
    for i=1:K
        uDiff = uDiff + 1/T*(u_hat_plus(n,:,i)-u_hat_plus(n-1,:,i))*conj((u_hat_plus(n,:,i)-u_hat_plus(n-1,:,i)))';
    end
    uDiff = abs(uDiff);
    
end

%------���������
% discard empty space if converged early ������������������հ׿ռ�
N = min(N,n);
omega = omega_plus(1:N,:);

% Signal reconstruction �ź��ؽ�
u_hat = zeros(T, K);
u_hat((T/2+1):T,:) = squeeze(u_hat_plus(N,(T/2+1):T,:));
u_hat((T/2+1):-1:2,:) = squeeze(conj(u_hat_plus(N,(T/2+1):T,:)));
u_hat(1,:) = conj(u_hat(end,:));

u = zeros(K,length(t));

for k = 1:K
    u(k,:)=real(ifft(ifftshift(u_hat(:,k))));
end

% remove mirror part ȥ�����񲿷�
u = u(:,T/4+1:3*T/4);

% recompute spectrum ���¼���Ƶ��
clear u_hat;
for k = 1:K
    u_hat(:,k)=fftshift(fft(u(k,:)))';
end

end