function yy = my_elmit(x,y,m,xx)

n = length(x);
nn = length(xx);
yy = zeros(1,nn);
for i = 1:nn
    if xx(i) == x(end)
        yy(i) = y(end);
        continue
    elseif xx(i) == x(1)
        yy(i) = y(1);
        continue
    end
    
    
    dif = xx(i)-x;
    index = zeros(1,2);
    for j = 1:n
        if dif(j)<=0
            index(1) = round(j-1);
            index(2) = round(j);
            break
        end
    end
    
    index = sort(index);
    x_temp = x(index);
    y_temp = y(index);
    m_temp = m(index);
    
    
    s_1 = (xx(i) - x_temp(2))^2 * (1 + 2*(xx(i)-x_temp(1))/diff(x_temp)) / diff(x_temp)^2 * y_temp(1);
    s_2 = (xx(i) - x_temp(1))^2 * (1 - 2*(xx(i)-x_temp(2))/diff(x_temp)) / diff(x_temp)^2 * y_temp(2);
    s_3 = (xx(i) - x_temp(2))^2 * (xx(i) - x_temp(1)) / diff(x_temp)^2 * m_temp(1);
    s_4 = (xx(i) - x_temp(1))^2 * (xx(i) - x_temp(2)) / diff(x_temp)^2 * m_temp(2);
    s = s_1 + s_2 + s_3 + s_4;
    yy(i) = s;
end
end