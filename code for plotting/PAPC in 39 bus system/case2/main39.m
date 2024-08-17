%% 定义颜色
c= [0.0000    0.4470    0.7410
    0.8500    0.3250    0.0980
    0.9290    0.6940    0.1250
    0.4940    0.1840    0.5560
    0.4660    0.6740    0.1880
    0.3010    0.7450    0.9330
    0.6350    0.0780    0.1840
    0.80392   0.71765   0.7098
    0.5451    0.53725   0.43922
    0.25098   0.87843   0.81569];
% misty rose;  lemonchiffon; yturquoise(浅蓝色) 
%% 定义系统变量
P_base = 1e3*[0.5609;0.6011;0.6995;0.6432;0.5676;0.6634;0.5676;0.5897;0.8444;0.3464];
V_m = [1.03;0.982;0.9831;0.9972;1.0123;1.0493;1.0635;1.0278;1.0265;1.048]*sqrt(2/3);
deg = [19.62;0;2.466;4.423;3.398;5.698;8.494;2.181;7.784;-3.646]*pi/180;

Pmax = [1.20; 1.10; 1.15; 1.15;1.10;1.10;1.15;1.20;1.20;1.00];
Pmin = 2-Pmax;
kp = 5*ones(10,1);

P_max_pu = roundn(Pmax.*P_base,-1);
P_min_pu = Pmin.*P_base;

kp_pu = kp.*P_base/1e3;
%% 读取数据
fre = fre_in_vsc;
t = fre.time;
ts = 1e-4;
%% 画P

num1 = [2 3 6 8];
num2 = [1 4 5 7 ] ;
num3 = [9 10];
figure
for i = num1
plot(t,P.signals(i).values,"Color",c(i,:),"LineWidth",1)
hold on
end
for i = num1
plot(t,P_max_pu(i)*ones(length(t),1),"Color",c(i,:),"LineWidth",0.5,"LineStyle","--")
hold on
end
hold off

set(gca,'fontsize',8,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 6 4.2])
xlabel('Time(s)','fontsize',8,'fontname','Arial')
ylabel('Pe(MW)','fontsize',8,'fontname','Arial')
yticks(sort(P_max_pu(num1)))
legend({'CIG2','CIG3','CIG6','CIG8'},'fontsize',8,'fontname','Arial');
leg = legend('CIG2','CIG3','CIG6','CIG8');

leg.ItemTokenSize = [20 10];

xlim([5.8 7])
ylim([570 980])

figure
for i = num2
plot(t,P.signals(i).values,"Color",c(i,:),"LineWidth",1)
hold on
end
for i = num2
plot(t,P_max_pu(i)*ones(length(t),1),"Color",c(i,:),"LineWidth",0.5,"LineStyle","--")
hold on
end
hold off

set(gca,'fontsize',8,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 6 4.2])
xlabel('Time(s)','fontsize',8,'fontname','Arial')
ylabel('Pe(MW)','fontsize',8,'fontname','Arial')
yticks(sort(P_max_pu(num2)))
legend({'CIG1','CIG4','CIG5','CIG7'},'fontsize',8,'fontname','Arial');
leg = legend('CIG1','CIG4','CIG5','CIG7');

leg.ItemTokenSize = [20 10];

xlim([5.8 7])
ylim([500 850])

figure
for i = num3
plot(t,P.signals(i).values,"Color",c(i,:),"LineWidth",1)
hold on
end
for i = num3
plot(t,P_max_pu(i)*ones(length(t),1),"Color",c(i,:),"LineWidth",0.5,"LineStyle","--")
hold on
end
hold off

set(gca,'fontsize',8,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 6 4.2])
xlabel('Time(s)','fontsize',8,'fontname','Arial')
ylabel('Pe(MW)','fontsize',8,'fontname','Arial')
% yticks(sort(P_max_pu(num2)))
legend({'CIG9','CIG10'},'fontsize',8,'fontname','Arial');
leg = legend('CIG9','CIG10');

leg.ItemTokenSize = [20 10];

xlim([5.8 7])
% ylim([570 90])
% %23一开始出死区 %10是纯下垂
% %86逐渐卡在上备用 14 57 9
% %% 定义线宽 图例
%% 画fre

num1 = [2 3 6 8];
num2 = [1 4 5 7 ] ;
num3 = [9 10];
figure
for i = num1
plot(t,fre.signals(i).values+60,"Color",c(i,:),"LineWidth",1)
hold on
end

hold off

set(gca,'fontsize',8,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 6 4.2])
xlabel('Time(s)','fontsize',8,'fontname','Arial')
ylabel('Frequency(Hz)','fontsize',8,'fontname','Arial')

legend({'CIG2','CIG3','CIG6','CIG8'},'fontsize',8,'fontname','Arial');
leg = legend('CIG2','CIG3','CIG6','CIG8');

leg.ItemTokenSize = [20 10];

xlim([5.8 7])
ylim([59.85 60.10])

figure
for i = num2
plot(t,fre.signals(i).values+60,"Color",c(i,:),"LineWidth",1)
hold on
end

hold off

set(gca,'fontsize',8,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 6 4.2])
xlabel('Time(s)','fontsize',8,'fontname','Arial')
ylabel('Frequency(Hz)','fontsize',8,'fontname','Arial')
legend({'CIG1','CIG4','CIG5','CIG7'},'fontsize',8,'fontname','Arial');
leg = legend('CIG1','CIG4','CIG5','CIG7');

leg.ItemTokenSize = [20 10];

xlim([5.8 7])
ylim([59.95 60.05])

figure
for i = num3
plot(t,fre.signals(i).values+60,"Color",c(i,:),"LineWidth",1)
hold on
end
hold off

set(gca,'fontsize',8,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 6 4.2])
xlabel('Time(s)','fontsize',8,'fontname','Arial')
ylabel('Frequency(Hz)','fontsize',8,'fontname','Arial')
% yticks(sort(P_max_pu(num2)))
legend({'CIG9','CIG10'},'fontsize',8,'fontname','Arial');
leg = legend('CIG9','CIG10');

leg.ItemTokenSize = [20 10];

xlim([5.8 7])