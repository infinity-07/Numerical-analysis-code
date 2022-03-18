function c = get_coefficients(f)
    n = length(f)-1;
    d = ones(1,n-1)*4;
    l = [0,ones(1,n-2)];
    u = [ones(1,n-2),0];
    b = f(2:n);
    b(1) = b(1) - 1/6*f(1);
    b(end) = b(end) - 1/6*f(end);

    c_mid = sol_tri_matrix(d,l,u,b);

    c_0 = f(1)/6;
    c_n = f(end)/6;
    c_left = 2*c_0-c_mid(1);
    c_right = 2*c_n-c_mid(end);
    c = [c_left,c_0,c_mid,c_n,c_right];
end