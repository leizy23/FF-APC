t = P.time;
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
hold on
plot(t,64.24*ones(length(t),1),"Color",[0.9290 0.6940 0.1250],"LineWidth",0.5,"LineStyle","-.");
hold on
plot(t,139.06*ones(length(t),1),"Color",[0 0.4470 0.7410],"LineWidth",0.5,"LineStyle","-.");
hold on
plot(t,72.70*ones(length(t),1),"Color",[0.8500 0.3250 0.0980],"LineWidth",0.5,"LineStyle","-.");
xlabel('Time(s)')
set(gca,'fontsize',7,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 5 3.5])
xlabel('Time(s)','fontsize',7,'fontname','Arial')
ylabel('Pe(MW)','fontsize',7,'fontname','Arial')
legend({'CIG1','CIG2','CIG3'},'fontsize',7,'fontname','Arial');
leg = legend('CIG1','CIG2','CIG3');

leg.ItemTokenSize = [20 10];
xlim([9 20])
ylim([40 220])
yticks([82.10 98.36 139.06])
%%
figure
plot(t,P.signals(1).values/1e6,"Color",[0.9290 0.6940 0.1250],"LineWidth",1);
% hold on
% plot(t,P.signals(2).values/1e6,"Color",[0 0.4470 0.7410],"LineWidth",1);
hold on
plot(t,P.signals(3).values/1e6,"Color",[0.8500 0.3250 0.0980],"LineWidth",1);
hold on
plot(t,82.10*ones(length(t),1),"Color",[0.9290 0.6940 0.1250],"LineWidth",0.5,"LineStyle","--");
% hold on
% plot(t,196.32*ones(length(t),1),"Color",[0 0.4470 0.7410],"LineWidth",0.5,"LineStyle","--");
hold on
plot(t,98.36*ones(length(t),1),"Color",[0.8500 0.3250 0.0980],"LineWidth",0.5,"LineStyle","--");
hold on
plot(t,64.24*ones(length(t),1),"Color",[0.9290 0.6940 0.1250],"LineWidth",0.5,"LineStyle","-.");
% hold on
% plot(t,130.88*ones(length(t),1),"Color",[0 0.4470 0.7410],"LineWidth",0.5,"LineStyle","-.");
hold on
plot(t,72.70*ones(length(t),1),"Color",[0.8500 0.3250 0.0980],"LineWidth",0.5,"LineStyle","-.");
xlabel('Time(s)')
set(gca,'fontsize',7,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 5 3.5])
xlabel('Time(s)','fontsize',7,'fontname','Arial')
ylabel('Pe(MW)','fontsize',7,'fontname','Arial')
legend({'CIG1','CIG3'},'fontsize',7,'fontname','Arial');
leg = legend('CIG1','CIG3');

leg.ItemTokenSize = [20 10];
xlim([9 20])
ylim([40 120])
yticks([82.10 98.36])

%%
t = P16.time;
ts = 1e-4;
figure
plot(t,P17.signals(2).values/1e6,"Color",[0 0.4470 0.7410],"LineWidth",1);
hold on
plot(t,P16.signals(2).values/1e6,'r',"LineWidth",1);
xlabel('Time(s)')
set(gca,'fontsize',7,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 5 3.5])
xlabel('Time(s)','fontsize',7,'fontname','Arial')
ylabel('Pe(MW)','fontsize',7,'fontname','Arial')
legend({'tc=0.17','tc=0.16'},'fontsize',7,'fontname','Arial');
leg = legend('tc=0.17','tc=0.16');

leg.ItemTokenSize = [20 10];
xlim([9 20])
% ylim([40 220])

i = 1;
figure%%,"LineStyle","-"
plot(t,fre.signals(i).values-59.9962837510398+60,"Color",[0.9290 0.6940 0.1250],"LineWidth",1);
hold on
plot(t,fre.signals(i+1).values-59.9962837510398+60,"Color",[0 0.4470 0.7410],"LineWidth",1);
hold on
plot(t,fre.signals(i+2).values-59.9962837510398+60,"Color",[0.8500 0.3250 0.0980],"LineWidth",1);

set(gca,'fontsize',7,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 5 3.5])
xlabel('Time(s)','fontsize',7,'fontname','Arial')
ylabel('Frequency(Hz)','fontsize',7,'fontname','Arial')
legend({'CIG1','CIG2','CIG3'},'fontsize',7,'fontname','Arial');

%legend({'Bus7','Bus8','Bus9'},'fontsize',8,'fontname','Arial');
xlim([9 20])
ylim([59 60.4])
leg = legend('CIG1','CIG2','CIG3');

leg.ItemTokenSize = [20 10];