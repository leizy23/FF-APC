t = fre.time;
ts = 1e-4;
figure
% plot(t,P.signals(2).values/1e6,"Color",[0.9290 0.6940 0.1250],"LineWidth",1);
% hold on
% plot(t,196.32*ones(length(t),1),"Color",[0.9290 0.6940 0.1250],"LineWidth",0.5,"LineStyle","--");

plot(t,P.signals(1).values/1e6,"Color",[0.9290 0.6940 0.1250],"LineWidth",1);
hold on
plot(t,P.signals(3).values/1e6,"Color",[0.8500 0.3250 0.0980],"LineWidth",1);
% 
hold on
plot([0 20],82.10*ones(2,1),"Color",[0.9290 0.6940 0.1250],"LineWidth",0.5,"LineStyle","--");

hold on
plot([0 20],98.36*ones(2,1),"Color",[0.8500 0.3250 0.0980],"LineWidth",0.5,"LineStyle","--");

hold on
plot(t,80.487*ones(length(t),1),"Color",[0.9290 0.6940 0.1250],"LineWidth",0.5,"LineStyle","-.");

hold on
plot(t,96.649*ones(length(t),1),"Color",[0.8500 0.3250 0.0980],"LineWidth",0.5,"LineStyle","-.");

set(gca,'fontsize',7,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 5 3.5])
xlabel('Time(s)','fontsize',7,'fontname','Arial')
ylabel('Pe(MW)','fontsize',7,'fontname','Arial')
  legend({'CIG1','CIG3'},'fontsize',7,'fontname','Arial');
  leg = legend('CIG1','CIG3');  %,'CIG2'

leg.ItemTokenSize = [20 10];

 % legend({'CIG2'},'fontsize',7,'fontname','Arial');
%  legend({'Bus4','Bus5','Bus6'},'fontsize',8,'fontname','Arial');
% legend({'Bus7','Bus8','Bus9'},'fontsize',8,'fontname','Arial');
xlim([6 55])
yticks([70 80.49 96.65 110])

%%
figure
plot(t,P.signals(2).values/1e6,"Color",[0 0.4470 0.7410],"LineWidth",1);
hold on
plot(t,196.32*ones(length(t),1),"Color",[0 0.4470 0.7410],"LineWidth",0.5,"LineStyle","--");

% plot(t,P.signals(1).values/1e6,"Color",[0.9290 0.6940 0.1250],"LineWidth",1);
% hold on
% plot(t,P.signals(3).values/1e6,"Color",[0.8500 0.3250 0.0980],"LineWidth",1);
% % 
% hold on
% plot([0 20],82.10*ones(2,1),"Color",[0.9290 0.6940 0.1250],"LineWidth",0.5,"LineStyle","--");
% 
% hold on
% plot([0 20],98.36*ones(2,1),"Color",[0.8500 0.3250 0.0980],"LineWidth",0.5,"LineStyle","--");
% 
% hold on
% plot(t,80.487*ones(length(t),1),"Color",[0.9290 0.6940 0.1250],"LineWidth",0.5,"LineStyle","-.");
% 
% hold on
% plot(t,96.649*ones(length(t),1),"Color",[0.8500 0.3250 0.0980],"LineWidth",0.5,"LineStyle","-.");
% 
set(gca,'fontsize',7,'fontname','Arial');
set(gcf,'unit','centimeters','position',[10 5 5 3.5])
xlabel('Time(s)','fontsize',7,'fontname','Arial')
ylabel('Pe(MW)','fontsize',7,'fontname','Arial')
  legend({'CIG2'},'fontsize',7,'fontname','Arial');
  leg = legend('CIG2');  %,'CIG2'

leg.ItemTokenSize = [20 10];

 % legend({'CIG2'},'fontsize',7,'fontname','Arial');
%  legend({'Bus4','Bus5','Bus6'},'fontsize',8,'fontname','Arial');
% legend({'Bus7','Bus8','Bus9'},'fontsize',8,'fontname','Arial');
xlim([6 55])
yticks([170 180 190 196.32])

