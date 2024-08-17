function y = SG_dae(x)
% 需要定义全局变量供给dea使用
global m1 m2 index_FPZ index_Vtheta index_PQ Pmax_PFZ Kp P_load Q_load V_m V_a nb Y J D Pref_SG P_load_SG omega0
y = zeros(length(x),1);
% x： 1 - （m1-1） 是 SG的相角 作为状态量； m1到2*m1 - 1 是SG的频率； 也是状态量 ；
% 2*m1 到 m1+nb-1是非SG的相角 代数量
% m1+nb 到 2nb-1是非SG的幅值 代数量

% 定义相角
V_angle = zeros(nb,1);
V_angle(index_FPZ(1:end-1,1),1) = x(1:m1-1,1); % 定义前m1-1个为状态变量，  相角
V_angle(index_PQ,1) = x(2*m1:m1+nb-1,1);          % 2m1到m1+nb-1 - 
V_angle(index_Vtheta,1) = V_a(index_Vtheta,1);  %已知量 参考相位

% 定义相角
V_mag = zeros(nb,1);
V_mag([index_FPZ],1)  =V_m([index_FPZ],1) ; %已知量
V_mag(index_PQ,1) = x(end+1-length(index_PQ):end,1); %最后的代数量为PQ节点的电压幅值

% 定义频率

omega = x(m1:2*m1-1,1);



%定义所有的电压相量以及导纳
V = V_mag.*exp(1i*V_angle);


S_temp = V.*conj(Y*V) ;  % 计算得到的功率
P = real(S_temp);
Q = imag(S_temp);

% 对1：m1-1的状态量 相角
y(1:m1-1,1) = omega(1:m1-1,1) - omega(end,1)*ones(m1-1,1); 
% 对m1：2m1-1的状态量
y(m1:2*m1-1,1) = (Pref_SG-P_load_SG-P(index_FPZ,1)-D.*(omega(1:m1,1) - omega0*ones(m1,1)))./J;

% 所有负荷节点相角对应的代数量
y(2*m1:m1+nb-1,1) = P_load - P(index_PQ,1);

% 所有负荷节点幅值对应的代数量
y(end+1-length(index_PQ):end,1) = Q_load - Q(index_PQ,1);