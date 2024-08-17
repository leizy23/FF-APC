function y = FPZ_dae(x)
% 需要定义全局变量供给dea使用
global m1 m2 index_FPZ index_Vtheta index_PQ Pmax_PFZ Kp P_load Q_load V_m V_a nb Y omega0
y = zeros(length(x),1);
% 定义相角
V_angle = zeros(nb,1);
V_angle(index_Vtheta,1) = V_a(index_Vtheta,1);  %已知量
V_angle([index_FPZ;index_PQ],1) = x(1:length([index_FPZ;index_PQ]),1); % 定义前m1个为状态变量， 后面nb-（m1+m2）为代数量 是PQ节点对应的电压幅值

% 定义相角
V_mag = zeros(nb,1);
V_mag([index_FPZ;index_Vtheta],1)  =V_m([index_FPZ;index_Vtheta],1) ; %已知量
V_mag(index_PQ,1) = x(end+1-length(index_PQ):end,1); %最后的代数量为PQ节点的电压幅值

%定义所有的电压相量以及导纳
V = V_mag.*exp(1i*V_angle);


S_temp = V.*conj(Y*V) ;  % 计算得到的功率
P = real(S_temp);
Q = imag(S_temp);

% 对1：m1的状态量
y(1:m1,1) = Kp.*(Pmax_PFZ - P(index_FPZ,1)); 
% 所有负荷节点相角对应的代数量
y(m1+1:length([index_FPZ;index_PQ]),1) = P_load - P(index_PQ,1);

% 所有负荷节点幅值对应的代数量
y(end+1-length(index_PQ):end,1) = Q_load - Q(index_PQ,1);