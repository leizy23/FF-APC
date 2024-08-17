function y = FPZ_SG_dae(x)
% 需要定义全局变量供给dea使用
global m1 m2 m3 index_SG index_FPZ index_Vtheta index_PQ Pmax_PFZ P_load_FPZ Kp P_load Q_load V_m V_a nb Y J D Pref_SG P_load_SG omega0
y = zeros(length(x),1);
% x： 1 到 m1 是 SG的相角 作为状态量； m1+1 到m1 + m2 是FPZ的相角； 也是状态量 ；
% m1+m2+1 到 2 * m1 + m2是SG的频率 是状态量
% 2 * m1 + m2+1 到  m1 + nb -m3 是PQ的相角 代数量
% m1 + nb -m3 +1 到 2*nb - m2 - 2*m3是PQ的幅值 代数量

% 定义相角
V_angle = zeros(nb,1);
V_angle(index_SG,1) = x(1:m1,1); % 定义前m1个为状态变量， SG 相角
V_angle(index_FPZ,1) = x(m1+1:m1+m2,1);          % m1+1到m1+m2 - 是FPZ相角 也是状态量
V_angle(index_Vtheta,1) = V_a(index_Vtheta,1);  %已知量 参考相位
V_angle(index_PQ,1) = x((2 * m1 + m2+1):(m1 + nb -m3),1);  %PQ相位 代数量

% 定义相角
V_mag = zeros(nb,1);
V_mag([index_Vtheta;index_FPZ;index_SG],1)  =V_m([index_Vtheta;index_FPZ;index_SG],1) ; %已知量
V_mag(index_PQ,1) = x(end+1-length(index_PQ):end,1); %最后的代数量为PQ节点的电压幅值

% 定义频率

omega = x(m1+m2+1:2*m1+m2,1);



%定义所有的电压相量以及导纳
V = V_mag.*exp(1i*V_angle);


S_temp = V.*conj(Y*V) ;  % 计算得到的功率
P = real(S_temp);
Q = imag(S_temp);

% x： 1 到 m1 是 SG的相角 作为状态量； m1+1 到m1 + m2 是FPZ的相角； 也是状态量 ；
% m1+m2+1 到 2 * m1 + m2是SG的频率 是状态量
% 2 * m1 + m2+1 到  m1 + nb -m3 是PQ的相角 代数量
% m1 + nb -m3 +1 到 2*nb - m2 - 2*m3是PQ的幅值 代数量

% 对1：m1的状态量 相角
y(1:m1,1) = omega(1:m1,1) - omega0*ones(m1,1); 
% 对m1+1 到m1 + m2 是FPZ的相角
y(m1+1:m1+m2,1) = Kp.*(Pmax_PFZ-P_load_FPZ- P(index_FPZ,1)); 

% m1+m2+1 到 2 * m1 + m2是SG的频率 是状态量
y((m1+m2+1):(2 * m1 + m2),1) = (Pref_SG-P_load_SG-P(index_SG,1)-D.*(omega(1:m1,1) - omega0*ones(m1,1)))./J;

% 所有负荷节点相角对应的代数量
y((2 * m1 + m2+1):( m1 + nb -m3),1) = P_load - P(index_PQ,1);

% 所有负荷节点幅值对应的代数量
y(end+1-length(index_PQ):end,1) = Q_load - Q(index_PQ,1);