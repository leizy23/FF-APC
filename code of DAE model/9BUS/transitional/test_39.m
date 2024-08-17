%% 测试9节点系统的小扰动稳定性
clear;
%%  需要定义全局变量供给dea使用
global m1 m2 m3 index_SG index_FPZ index_Vtheta index_PQ Pmax_PFZ P_load_FPZ Kp P_load Q_load V_m V_a nb Y J D Pref_SG P_load_SG omega0
omega0 = 120*pi;
mpc = loadcase('case9');
baseMVA = mpc.baseMVA;
bus     = mpc.bus;
branch  = mpc.branch;
gen     = mpc.gen;

nb = size(bus,1);                          %节点数
nl = size(branch,1);                       %支路数

% 定义索引的名称
[PQ, PV, REF, NONE, BUS_I, BUS_TYPE, PD, QD, GS, BS, BUS_AREA, VM, ...
    VA, BASE_KV, ZONE, VMAX, VMIN, LAM_P, LAM_Q, MU_VMAX, MU_VMIN] = idx_bus;              
[F_BUS, T_BUS, BR_R, BR_X, BR_B, RATE_A, RATE_B, RATE_C, ...
    TAP, SHIFT, BR_STATUS, PF, QF, PT, QT, MU_SF, MU_ST, ...
    ANGMIN, ANGMAX, MU_ANGMIN, MU_ANGMAX] = idx_brch;
[GEN_BUS, PG, QG, QMAX, QMIN, VG, MBASE, GEN_STATUS, PMAX, PMIN, ...
    MU_PMAX, MU_PMIN, MU_QMAX, MU_QMIN, PC1, PC2, QC1MIN, QC1MAX, ...
    QC2MIN, QC2MAX, RAMP_AGC, RAMP_10, RAMP_30, RAMP_Q, APF] = idx_gen;

Y = makeYbus(mpc);


%% 定义发电机节点以及 无穷大 发电机节点
m1 = 1;
m2 = 1;  % length(gen(:,1));
m3 = length(gen(:,1)) - m1 - m2;

temp_m = 1:length(gen(:,1));

randIndex = randperm(size(temp_m,1));


temp_m=temp_m(randIndex,:);

%节点对应索引
index_SG = gen(temp_m(1:m1),1);
index_FPZ = gen(temp_m(m1+1:m1+m2),1);

% index_SG = gen(m2+1:m1+m2,1);
% index_FPZ = gen(1:m2,1);

index_Vtheta = gen(temp_m((m1+m2+1):end),1);

% index_SG = gen([4,6,7,5],1);
% index_FPZ = gen([1,3,8],1);
% index_Vtheta = gen([2,9,10],1);

[temp_1, temp_2, index_PQ] = bustypes(bus, gen);    

%%  位于FPZ之外的发电机节点需要已知电压幅值 P作为Pmax
%计算节点注入功率
S_gen  = zeros(nb,1);
P      = zeros(nb,1);
Q      = zeros(nb,1);

S_gen(gen(:,GEN_BUS)) = gen(:,GEN_STATUS).*(gen(:,PG)+1i*gen(:,QG))/baseMVA;
S_load = (bus(:,PD)+1i*bus(:,QD))/baseMVA;
S_bus = S_gen-S_load;  % 净发电量 即使发电机节点为负值也无所谓

%获取减去负荷后的发电量作为最大功率
Pref_SG = real(S_gen(index_SG)); %获取减去负荷后的发电量作为最大功率
P_load_SG = real(S_load(index_SG));
J = 5*ones(length(index_SG),1)+2*rand(length(index_SG),1);
D = 0.5*ones(length(index_SG),1);
%+0.4*rand(length(index_SG),1)
Pmax_PFZ = real(S_gen(index_FPZ)); %获取减去负荷后的发电量作为最大功率
P_load_FPZ = real(S_load(index_FPZ));
Kp = 0.1*ones(length(index_FPZ),1);

% 获取负荷节点的PQ
P_load = real(S_bus(index_PQ));
Q_load = imag(S_bus(index_PQ));

% 获取所有发电机节点的电压幅值
V_m([index_SG;index_FPZ;index_Vtheta],1) = bus([index_SG;index_FPZ;index_Vtheta],VM);
V_a(index_Vtheta,1) = bus(index_Vtheta,VA)*pi/180;


%% 稳定平衡点，状态矩阵，特征值和特征向量
num_dif = 2*m1 +m2;
num_alg = (nb-m1 - m2 -m3)*2;
%x0 = [0;0;0;0;0;0;delta;delta;delta;delta;delta;delta;phifd;phi1d;phi1q;phi2q;Efd;0;0;1;0;1;0;id;iq;ifd;0;0;0];
% x0 = [omega0;omega0;omega0;omega0;omega0;omega0;delta;delta;delta;delta;delta;delta;phifd;phi1d;phi1q;phi2q;Efd;0;0;id;iq;ifd;0;0;0];
x0 = ones(num_dif+num_alg,1);
x0(1:m1+m2,1) = bus([index_SG;index_FPZ],VA)*pi/180;
x0(m1+m2+1:2*m1+m2,1) = omega0;
x0(num_dif+1:num_dif+num_alg/2,1) = bus(index_PQ,VA)*pi/180;
x0(num_dif+1+num_alg/2:end,1) = bus(index_PQ,VM);
x1 = x0;
x0 = x0 - 0.01*ones(length(x0),1);


options=optimset('Display','iter');
[sep,fval] = fsolve('FPZ_SG_dae',x0,options);
% sep = x0;
norm(FPZ_SG_dae(sep))
if norm(FPZ_SG_dae(sep)) > 1e-6
    error('Not an equibrium point!');
end

%% 检验结果是否正确
error_cal = sep - x1;
max(error_cal)
%% 状态方程 计算特征值
J_A = Jac_f(@FPZ_SG_dae,sep);
%微分代数方程状态矩阵计算
J_s = J_A(1:num_dif,1:num_dif) - J_A(1:num_dif,num_dif+1:end)*(J_A(num_dif+1:end,num_dif+1:end))^(-1)*J_A(num_dif+1:end,1:num_dif);

[V,D] = eig(J_s);

%特征值
eg_va = diag(D);
fre = imag(eg_va)/(2*pi);
delta = -real(eg_va)./abs(eg_va);

min(delta)

eg_va_MIX = eg_va;
save('MIX.mat','eg_va_MIX');