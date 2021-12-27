function U=Crank_Nicolson(f,a,x0,xn,dx,t0,tm,dt,g,s0,sn)
M=(tm-t0)/dt;
N=(xn-x0)/dx;
x=x0+dx:dx:xn-dx;
t=t0:dt:tm;
u=feval(g,x);
u=u';
r=a*dt/dx/dx;
A=-r/2*[zeros(1,N-1);eye(N-2,N-2),zeros(N-2,1)]-r/2*...
    [zeros(N-2,1),eye(N-2,N-2);zeros(1,N-1)]+(1+r)*eye(N-1,N-1);
A=inv(A);
B=r/2*[zeros(1,N-1);eye(N-2,N-2),zeros(N-2,1)]+r/2*...
    [zeros(N-2,1),eye(N-2,N-2);zeros(1,N-1)]+(1-r)*eye(N-1,N-1);
U=[];
for k=1:M
    C=dt*feval(f,x,t(k)+0.5*dt);
    C=C';
    C(1)=C(1)+r/2*(feval(s0,t(k))+feval(s0,t(k+1)));
    C(N-1)=C(N-1)+r/2*(feval(sn,t(k))+feval(sn,t(k+1)));
    u=A*(B*u+C);
    U=[U;u'];
end
   