%% 参数定
P_base = 1e3*[0.5609;0.6011;0.6995;0.6432;0.5676;0.6634;0.5676;0.5897;0.8444;0.3464];
V_m = [1.03;0.982;0.9831;0.9972;1.0123;1.0493;1.0635;1.0278;1.0265;1.048]*sqrt(2/3);
deg = [19.62;0;2.466;4.423;3.398;5.698;8.494;2.181;7.784;-3.646]*pi/180;

Pmax = [1.20; 1.10; 1.15; 1.15;1.10;1.10;1.15;1.20;1.20;1.00];
Pmin = 2-Pmax;
kp = 5*ones(10,1);

P_max_pu = Pmax.*P_base;
P_min_pu = Pmin.*P_base;

kp_pu = kp.*P_base/1e3;
%%

fre = fre_in_vsc;
t = fre.time;
ts = 1e-4;


%%
figure
plot(t,P.signals(1).values/1e6,"Color",[0.9290 0.6940 0.1250],"LineWidth",1);
hold on
plot(t,P.signals(2).values/1e6,"Color",[0 0.4470 0.7410],"LineWidth",1);
hold on
plot(t,P.signals(3).values/1e6,"Color",[0.8500 0.3250 0.0980],"LineWidth",1);
hold on
plot(t,82.10*ones(length(t),1),"Color",[0.9290 0.6940 0.1250],"LineWidth",0.5,"LineStyle","--");
hold on
plot(t,196.32*ones(length(t),1),"Color",[0 0.4470 0.7410],"LineWidth",0.5,"LineStyle","--");
hold on
plot(t,98.36*ones(length(t),1),"Color",[0.8500 0.3250 0.0980],"LineWidth",0.5,"LineStyle","--");
xlabel('Time(s)')
set(gca,'fontsize',7,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 5 3.5])
xlabel('Time(s)','fontsize',7,'fontname','Arial')
ylabel('Pe(MW)','fontsize',7,'fontname','Arial')
legend({'CIG1','CIG2','CIG3'},'fontsize',7,'fontname','Arial');
xlim([9.99 10.20])
ylim([70 220])
yticks([82.10 98.36 150 196.32])
leg = legend('CIG1','CIG2','CIG3');

leg.ItemTokenSize = [20 10];
%%
ta = 10.0617;
tb = 10.04;
t1= [ts:ts:ta];
t2 = [ts:ts:tb];
fre1 = 59.9604;
fre2 = 59.8782;


i = 1;
figure%%,"LineStyle","-"
plot(t,fre.signals(i).values-59.9962837510398+60,"Color",[0.9290 0.6940 0.1250],"LineWidth",1);
hold on
plot(t,fre.signals(i+1).values-59.9962837510398+60,"Color",[0 0.4470 0.7410],"LineWidth",1);
hold on
plot(t,fre.signals(i+2).values-59.9962837510398+60,"Color",[0.8500 0.3250 0.0980],"LineWidth",1);
% hold on
% plot(t1,fre1*ones(length(t1),1),"Color",[0.9290 0.6940 0.1250],"LineWidth",0.5,"LineStyle","--");
hold on
plot(t2,fre2*ones(length(t2),1),"Color",[0.8500 0.3250 0.0980],"LineWidth",0.5,"LineStyle","--");
% hold on
% plot(ta*ones(2,1),[fre1,0],"Color",[0.9290 0.6940 0.1250],"LineWidth",0.5,"LineStyle","--");
hold on
plot(tb*ones(2,1),[fre2,0],"Color",[0.8500 0.3250 0.0980],"LineWidth",0.5,"LineStyle","--");
hold on
plot(t,59.9735*ones(length(t),1),"Color",[0 0.4470 0.7410],"LineWidth",0.5,"LineStyle","--");
% hold on
% plot(t,fre.signals(i+7).values-59.9962837510398+60,"Color",[0.4660 0.6740 0.1880],"LineWidth",1);
set(gca,'fontsize',7,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 5 3.5])
xlim([9.98 10.2])
ylim([59.84 60.03])
xlabel('Time(s)','fontsize',7,'fontname','Arial') 
ylabel('Frequency(Hz)','fontsize',7,'fontname','Arial')
yticks([59.84 59.88 59.97 60])
legend({'CIG1','CIG2','CIG3'},'fontsize',7,'fontname','Arial');

%legend({'Bus7','Bus8','Bus9'},'fontsize',8,'fontname','Arial');
leg = legend('CIG1','CIG2','CIG3');

leg.ItemTokenSize = [20 10];

%（10,5）为图形左下角坐标，表示左下点离显示器左侧边界10cm，离下侧边界5cm 图形边框大小为8cm，宽6cm
%%
i = 4;
figure%%,"LineStyle","-"
plot(t,fre.signals(i).values-59.9962837510398+60,"Color",[0.9290 0.6940 0.1250],"LineWidth",1);
hold on
plot(t,fre.signals(i+1).values-59.9962837510398+60,"Color",[0 0.4470 0.7410],"LineWidth",1);
hold on
plot(t,fre.signals(i+2).values-59.9962837510398+60,"Color",[0.8500 0.3250 0.0980],"LineWidth",1);
hold on 
plot(t,fre.signals(i+3).values-59.9962837510398+60,"Color",[0.4660 0.6740 0.1880],"LineWidth",1);
hold on
plot(t,fre.signals(i+4).values-59.9962837510398+60,"Color",[0.3010 0.7450 0.9330],"LineWidth",1);
hold on
plot(t,fre.signals(i+5).values-59.9962837510398+60,"Color",[0.4940 0.1840 0.5560],"LineWidth",1);
hold on
plot([0 10.0195],59.49*ones(2,1),"Color",[0.3010 0.7450 0.9330],"LineWidth",0.5,"LineStyle","--");
hold on
plot([10.0195 10.0195],[0 59.49]*ones(2,1),"Color",[0.3010 0.7450 0.9330],"LineWidth",0.5,"LineStyle","--");
hold on
plot(t,59.9735*ones(length(t),1),"Color",[0 0.4470 0.7410],"LineWidth",0.5,"LineStyle","--");
set(gca,'fontsize',7,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 5 3.5])
xlabel('Time(s)','fontsize',7,'fontname','Arial')
ylabel('Frequency(Hz)','fontsize',7,'fontname','Arial')
yticks([59.49 59.75 59.97])
%legend({'CIG1','CIG2','CIG3'},'fontsize',8,'fontname','Arial');
legend({'Bus4','Bus5','Bus6','Bus7','Bus8','Bus9'},'fontsize',7,'fontname','Arial');
leg = legend('Bus4','Bus5','Bus6','Bus7','Bus8','Bus9');

leg.ItemTokenSize = [20 10];
% legend({'Load3'},'fontsize',7,'fontname','Arial');
%legend({'Bus7','Bus8','Bus9'},'fontsize',8,'fontname','Arial');
xlim([9.98 10.2])
ylim([59.44 60.15])
%（10,5）为图形左下角坐标，表示左下点离显示器左侧边界10cm，离下侧边界5cm 图形边框大小为8cm，宽6cm



%%
% i = 4;
% figure%%,"LineStyle","-"
% plot(t,V_mag.signals(i).values,"Color",[0.9290 0.6940 0.1250],"LineWidth",1);
% hold on
% plot(t,V_mag.signals(i+1).values,"Color",[0 0.4470 0.7410],"LineWidth",1);
% hold on
% plot(t,V_mag.signals(i+2).values,'r',"LineWidth",1);
% hold on 
% plot(t,V_mag.signals(i+3).values,"Color",[0.4660 0.6740 0.1880],"LineWidth",1);
% hold on
% plot(t,V_mag.signals(i+4).values,"Color",[0.3010 0.7450 0.9330],"LineWidth",1);
% hold on
% plot(t,V_mag.signals(i+5).values,"Color",[0.4940 0.1840 0.5560],"LineWidth",1);
% set(gca,'fontsize',8,'fontname','Arial');
% set(gcf,'unit','centimeters','position',[10 5 7.5 4])
% xlabel('Time(s)','fontsize',8,'fontname','Arial')
% ylabel('Voltage(pu)','fontsize',8,'fontname','Arial')
%  % legend({'CIG1','CIG2','CIG3'},'fontsize',8,'fontname','Arial');
% % legend({'Bus4','Bus5','Bus6'},'fontsize',8,'fontname','Arial');
% legend({'Bus4','Bus5','Bus6','Bus7','Bus8','Bus9'},'fontsize',8,'fontname','Arial');
% xlim([8.2 13.1])
% ylim([0.99 1.055])