function sol = sol_tri_matrix(d,l,u,f)
    % l1 = 0;   un = 0;
    n = length(d);
    sol = zeros(1,n);
    for i = 2:n
        d(i) = d(i) - u(i-1)*l(i)/d(i-1);
        f(i) = f(i) - f(i-1)*l(i)/d(i-1);
    end
    
    sol(n) = f(n)/d(n);
    for i = n-1:-1:1
        sol(i) = (f(i) - u(i)*sol(i+1))/d(i);
    end
    
end