%%绘制环形柱状图
%% 首先读取变量
% 上界
P_base = 1e3*[0.5609;0.6011;0.6995;0.6432;0.5676;0.6634;0.5676;0.5897;0.8444;0.3464];
V_m = [1.03;0.982;0.9831;0.9972;1.0123;1.0493;1.0635;1.0278;1.0265;1.048]*sqrt(2/3);
deg = [19.62;0;2.466;4.423;3.398;5.698;8.494;2.181;7.784;-3.646]*pi/180;

Pmax = [1.20; 1.10; 1.15; 1.15;1.10;1.10;1.15;1.20;1.20;1.00];
Pmin = 2-Pmax;
kp = 5*ones(10,1);

P_max_pu = Pmax.*P_base;
P_min_pu = Pmin.*P_base;

% 初始值
P_begin = zeros(10,1);
P_end = zeros(10,1);
for i = 1:10
    P_begin(i) = P.signals(i).values(50000,1);
    P_end(i) = P.signals(i).values(90000,1);
end

Data = [P_begin,P_end-P_begin,P_max_pu-P_end];
for i = 1:10
    for j = 1:3
        if abs(Data(i,j))<=1
            Data(i,j) = 0;
        end
    end
end
%% 绘图

% 数据名称 label
% 'Class-1','Class-2',... ...,'Class-6'
Name1 = compose('CIG%d', 1:10);
Name2{1,1} = 'Active power before disturbance';
Name2{1,2} = 'Power increasement after disturbance';
Name2{1,3} = 'Power reserve after disturbance';

% 配色

CList = [0.8941    0.8706    0.8078
    0.9255    0.7412    0.5843
    0.6078    0.6941    0.7333
    0.4745    0.6745    0.7412
    0.2039    0.3961    0.4588
    0.0431    0.2588    0.1294];
% CList = colorDemo(11)

% 数据展示范围及刻度
YLim = [];
YTick = [];

% =========================================================================
% 开始绘图
if isempty(YLim) || isempty(YTick)
    tFig = figure('Visible', 'off');
    tAx = axes('Parent',tFig);
    tAx.NextPlot = 'add';
    bar(tAx, Data, 'stacked')
    if isempty(YLim), YLim = tAx.YLim; else, tAx.YLim = YLim; end
    if isempty(YTick), YTick = tAx.YTick; end
    close(tFig)
end
% 创建图窗
fig = figure('Units','normalized', 'Position',[.2,.1,.5,.8]);
ax = axes('Parent',fig, 'Position',[0,0,1,1]);
ax.NextPlot = 'add';
ax.XColor = 'none';
ax.YColor = 'none';
ax.DataAspectRatio = [1,1,1];
% 绘制坐标轴和刻度线
TLim = [pi/2, -pi - pi/6];
t01 = linspace(0, 1, 80);
N = size(Data, 1);
tT = t01.*diff(TLim) + TLim(1);
tX = cos(tT).*(N + N/2 + 1);
tY = sin(tT).*(N + N/2 + 1);
plot(ax, tX, tY, 'LineWidth',.8, 'Color','k')
ax.XLim = [-1,1].*(N + N/2 + 2);
ax.YLim = [-1,1].*(N + N/2 + 2);
tT = (YTick - YLim(1))./diff(YLim).*diff(TLim) + TLim(1);
tX = [cos(tT).*(N + N/2 + 1); cos(tT).*(N + N/2 + 1 + N/50); tT.*nan];
tY = [sin(tT).*(N + N/2 + 1); sin(tT).*(N + N/2 + 1 + N/50); tT.*nan];
plot(ax, tX(:), tY(:), 'LineWidth',.8, 'Color','k')
for i = 1:length(YTick)
    iT = tT(i); iR = iT/pi*180;
    YTickHdl = text(ax, tX(2,i), tY(2,i),...
        num2str(YTick(i)), 'FontName','Arial', 'FontSize',12, 'HorizontalAlignment','center');
    if mod(iR, 360) > 180 && mod(iR, 360) < 360
        YTickHdl.Rotation = iR + 90;
        YTickHdl.VerticalAlignment = 'top';
    else
        YTickHdl.Rotation = iR - 90;
        YTickHdl.VerticalAlignment = 'bottom';
    end
end

Data = cumsum([zeros(N, 1), Data], 2);
% 绘制柱状图
for i = 1:N
    for j = 1:(size(Data, 2) - 1)
        tR = [(N + N/2 + 1 - i - .4).*ones(1, 80), (N + N/2 + 1 - i + .4).*ones(1, 80)];
        tT = (t01.*(Data(i, j + 1) - Data(i, j)) + Data(i, j) - YLim(1))./diff(YLim).*diff(TLim) + TLim(1);
        tX = cos([tT, tT(end:-1:1)]).*tR;
        tY = sin([tT, tT(end:-1:1)]).*tR;
        tHdl = fill(ax, tX, tY, CList(j,:), 'LineWidth',1, 'EdgeColor','k');
        if i == 1
            lgdHdl(j) = tHdl;
        end
    end
end
% 绘制数据名称
for i = 1:N
    text(ax, 0, N + N/2 + 1 - i, [Name1{i},'  '], 'FontName','Arial',...
        'FontSize',12, 'HorizontalAlignment','right');
end
% 绘制图例
legend(lgdHdl, Name2, 'FontName','Arial',...
    'FontSize',12, 'Box','off', 'Location','best',...
    'Position',[.22, .93 - .04*(size(Data, 2) - 1), .1, .04*(size(Data, 2) - 1)]);
