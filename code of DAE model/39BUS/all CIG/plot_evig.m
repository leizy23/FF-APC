%% 绘制特征值
CList = [0.8941    0.8706    0.8078
    0.9255    0.7412    0.5843
    0.6078    0.6941    0.7333
    0.4745    0.6745    0.7412
    0.2039    0.3961    0.4588
    0.0431    0.2588    0.1294
    0.85      0.93      0.87];
N = 1
C = [255 154 155
     153 152 255
     195 147 152
     217 238 223
     241 222 189]/255;
x = -50:1:0;
a = 0.0324;
y = x*sqrt(1/(a^2)-1);
basevalue = -3;
figure
area([-50 0],[3 3],basevalue);
colororder(C(4,:));
hold
fill([0 10 10 0],[-3 -3 3 3],C(5,:))
hold on
plot([-50 10],[0 0],'LineWidth',1.0,'LineStyle','-','Color','k');
hold on
plot([0 0],[-3 3],'LineWidth',1.0,'LineStyle','-','Color','k');
hold on 
p1 = scatter(real(eg_va_SG),imag(eg_va_SG),30,C(1,:),"o",'LineWidth',2.0);
hold on 
p2 = scatter(real(eg_va_MIX),imag(eg_va_MIX),100,C(2,:),"X",'LineWidth',2.0);
hold on 
p3 = scatter(real(eg_va_CIG),imag(eg_va_CIG),100,C(3,:),"*",'LineWidth',2.0);
% semilogx(real(eg_va_CIG),imag(eg_va_CIG),'*','MarkerFaceColor',CList(6,:),'MarkerSize',10);
legend([p1 p2 p3],{'In all-SG EPS','In transitional EPS','In all-CIG EPS'},'fontsize',8,'fontname','Arial')
xlabel('Real Axis(Seconds^{-1})','fontsize',8,'fontname','Arial')
ylabel('Imag Axis(Seconds^{-1})','fontsize',8,'fontname','Arial')

a=roundn(eg_va_SG,-4);
b = -real(eg_va_SG)./abs(eg_va_SG);

c=roundn(eg_va_MIX,-4);
d = -real(eg_va_MIX)./abs(eg_va_MIX);
e=roundn(eg_va_CIG,-4);
f = -real(eg_va_CIG)./abs(eg_va_CIG);


b = roundn(b,-4);
d = roundn(d,-4);
f = roundn(f,-4);
