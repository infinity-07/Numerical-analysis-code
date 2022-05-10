function yy = my_linear_interpolation(x,y,xx)

yy = ones(1,length(xx));
for i = 1:length(xx)
    [lia,loc] = ismember(xx(i),x);
    if lia == 1
        yy(i) = y(loc);
    else
        x1 = length(x) - find(fliplr(x)<=xx(i),1)+1;
        x2 = find(x>=(xx(i)),1);
        yy(i) = y(x2) - (y(x2)-y(x1))/(x(x2)-x(x1))*(x(x2)-xx(i));

    end

end
end