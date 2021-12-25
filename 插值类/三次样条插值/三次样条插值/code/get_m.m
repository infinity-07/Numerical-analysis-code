function m = get_m(x,y,u,v)
n = length(x);
lambda = zeros(1,n-2);
mu = zeros(1,n-2);
g = zeros(1,n-2);
h = diff(x);

for i = 1:n-2
    lambda(i) = h(i+1)/(h(i)+h(i+1));
    mu(i) = 1-lambda(i);
    g_1 = h(i)^2*(y(i+2)-y(i+1)) + h(i+1)^2*(y(i+1)-y(i));
    g_2 = h(i)^2*h(i+1)+h(i+1)^2*h(i);
    g(i) = 3 * g_1/g_2 ;
end

A_1 = diag(2*ones(1,n-2));
A_2 = diag(lambda(2:end),-1);
A_3 = diag(mu(1:end-1),1);
A = A_1+A_2+A_3;



b = g';

b(1) = b(1) - lambda(1)*u;
b(end) = b(end) - mu(end)*v;
m = A\b;
m = [u;m;v];

end