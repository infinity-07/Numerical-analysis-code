clc,clear,close all
x = 1:8;
y = [0.84 0.91 0.14 -0.76 -0.96 -0.28 0.66 0.99];
n = length(x);
u = 0.5403;
v = -0.1455;
m = get_m(x,y,u,v);
xx = x(1):0.01:x(end);
yy = my_elmit(x,y,m,xx);
plot(x,y,'*')
hold on
plot(xx,yy,'LineWidth',1.5)
h=legend('$(x_i,y_i)$','Three spline interpolation');
set(h,'Interpreter','latex','FontName','Times New Roman','FontSize',15,'FontWeight','normal')