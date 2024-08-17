t = fre.time;
ts = 1e-4;
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
ylim([70 200])
yticks([82.10 98.36 150 196.32])
leg = legend('CIG1','CIG2','CIG3');

leg.ItemTokenSize = [20 10];
%% []
ta = 10.1003;
tb = 10.0416;
t1= [ts:ts:ta];
t2 = [ts:ts:tb];
fre1 = 59.9967;
fre2 = 59.9453;


i = 1;
figure%%,"LineStyle","-"
plot(t,fre.signals(i).values,"Color",[0.9290 0.6940 0.1250],"LineWidth",1);
hold on
plot(t,fre.signals(i+1).values,"Color",[0 0.4470 0.7410],"LineWidth",1);
hold on
plot(t,fre.signals(i+2).values,"Color",[0.8500 0.3250 0.0980],"LineWidth",1);
hold on
plot(t1,fre1*ones(length(t1),1),"Color",[0.9290 0.6940 0.1250],"LineWidth",0.5,"LineStyle","--");
hold on
plot(t2,fre2*ones(length(t2),1),"Color",[0.8500 0.3250 0.0980],"LineWidth",0.5,"LineStyle","--");
hold on
plot(ta*ones(2,1),[fre1,0],"Color",[0.9290 0.6940 0.1250],"LineWidth",0.5,"LineStyle","--");
hold on
plot(tb*ones(2,1),[fre2,0],"Color",[0.8500 0.3250 0.0980],"LineWidth",0.5,"LineStyle","--");
set(gca,'fontsize',7,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 5 3.5])
xlim([9.98 10.20])
ylim([59.93 60.02])
yticks([59.94  59.96 59.98 60 60.02])
xlabel('Time(s)','fontsize',7,'fontname','Arial')
ylabel('Frequency(Hz)','fontsize',7,'fontname','Arial')
legend({'CIG1','CIG2','CIG3'},'fontsize',7,'fontname','Arial');
leg = legend('CIG1','CIG2','CIG3');

leg.ItemTokenSize = [20 10];


%%
i = 4;
figure%%,"LineStyle","-"
plot(t,V_mag.signals(i).values,"Color",[0.9290 0.6940 0.1250],"LineWidth",1);
hold on
plot(t,V_mag.signals(i+1).values,"Color",[0 0.4470 0.7410],"LineWidth",1);
hold on
plot(t,V_mag.signals(i+2).values,"Color",[0.3010 0.7450 0.9330],"LineWidth",1);
hold on 
plot(t,V_mag.signals(i+3).values,"Color",[0.4660 0.6740 0.1880],"LineWidth",1);
hold on
plot(t,V_mag.signals(i+4).values,'r',"LineWidth",1);
hold on
plot(t,V_mag.signals(i+5).values,"Color",[0.4940 0.1840 0.5560],"LineWidth",1);
hold on
plot(t,1.00456*ones(length(t),1),'r',"LineWidth",1,"LineStyle","--");
set(gca,'fontsize',7,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 5 3.5])
xlabel('Time(s)','fontsize',7,'fontname','Arial')
ylabel('Voltage(pu)','fontsize',7,'fontname','Arial')
 % legend({'CIG1','CIG2','CIG3'},'fontsize',8,'fontname','Arial');
% legend({'Bus4','Bus5','Bus6'},'fontsize',8,'fontname','Arial');
legend({'Bus4','Bus5','Bus6','Bus7','Bus8','Bus9'},'fontsize',7,'fontname','Arial');
leg = legend('Bus4','Bus5','Bus6','Bus7','Bus8','Bus9');

leg.ItemTokenSize = [20 10];
xlim([9.9 10.2])
ylim([0.99 1.08])
yticks([0.99 1.004 1.015 1.05])