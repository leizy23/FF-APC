%% 三维有功曲线

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

figure
fre = fre_in_vsc;
t = fre.time;
ts = 1e-4;
for i = 1:10
P_CIG(:,i) = P.signals(i).values;
end
for i = 1:10
plot3(ones(length(t),1)*i,t,P_CIG(:,i),"Color",c(i,:),"LineWidth",1);
hold on 
end
P_base = 1e3*[0.5609;0.6011;0.6995;0.6432;0.5676;0.6634;0.5676;0.5897;0.8444;0.3464];
V_m = [1.03;0.982;0.9831;0.9972;1.0123;1.0493;1.0635;1.0278;1.0265;1.048]*sqrt(2/3);
deg = [19.62;0;2.466;4.423;3.398;5.698;8.494;2.181;7.784;-3.646]*pi/180;

Pmax = [1.20; 1.10; 1.15; 1.15;1.10;1.10;1.15;1.20;1.20;1.00];
Pmin = 2-Pmax;

P_max_pu = Pmax.*P_base;
P_min_pu = Pmin.*P_base;
for i = 1:10
plot3(ones(length(t),1)*i,t,ones(length(t),1)*P_max_pu(i),"Color",c(i,:),"LineWidth",0.75,"LineStyle",':');
hold on 
end
for i = 1:10
plot3(ones(length(t),1)*i,t,ones(length(t),1)*P_min_pu(i),"Color",c(i,:),"LineWidth",0.5,"LineStyle",'--');
hold on 
end

hold off
% plot3(ones(length(t),1)*[1:10],t,ones(length(t),1)*(P_min_pu'),"Color",c(2,:),"LineWidth",1,"LineStyle",'--');
% 
% plot3(ones(length(t),1)*[1:10],t,ones(length(t),1)*(P_max_pu'),"Color",c(3,:),"LineWidth",1,"LineStyle",':');
grid on 
ylabel('Times(s)','fontsize',8,'fontname','Arial')
zlabel('Active power(MW)','fontsize',8,'fontname','Arial')
xlim([0 11])
ylim([5 15])

leg = legend('CIG1','CIG2','CIG3','CIG4','CIG5','CIG6','CIG7','CIG8','CIG9','CIG10');


leg.ItemTokenSize = [20 10];