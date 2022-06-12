clc,clear,close all
x = 1:8;
y = [0.84 0.91 0.14 -0.76 -0.96 -0.28 0.66 0.99];
n = length(x);
u = rand;
v = rand;
xx = x(1):0.01:x(end);
yy = cubic_spline_interpolation(x,y,xx,u,v);
plot(x,y,'*')
hold on
plot(xx,yy,'LineWidth',1.5)
h=legend('$(x_i,y_i)$','Three spline interpolation');
set(h,'Interpreter','latex','FontName','Times New Roman','FontSize',15,'FontWeight','normal')