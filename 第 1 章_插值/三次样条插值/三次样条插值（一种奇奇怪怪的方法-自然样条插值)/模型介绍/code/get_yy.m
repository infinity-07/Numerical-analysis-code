function yy = get_yy(x,c)

n = length(x);
a = x(1);
b = x(end);
xx = linspace(a,b,20*n+1);

h = x(2)-x(1);
syms t

B = @(t) 0.*(t<=-2) + ((t+2).^3) .* (t<=-1 & t>-2) + (1 + 3*(t+1) + 3*(t+1).^2 - 3*(t+1).^3) .* (t<=0 & t>-1) + (1 + 3*(1-t) + 3*(1-t).^2 - 3*(1-t).^3) .* (t<=1 & t>0) + ((2-t).^3) .* (t<=2 & t>1) + 0 .* (t>2);

x_extend = [x(1)-h,x,x(end)+h];


n = length(x_extend);
yy = 0;

for i = 1:n
    yy = yy + c(i)*B((xx-x_extend(i))/h);
end

end