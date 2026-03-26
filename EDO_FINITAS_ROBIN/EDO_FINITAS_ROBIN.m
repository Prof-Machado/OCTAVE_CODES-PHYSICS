clc
clear
close all

alf = 100; bet = 2; gam = 60;
a = 20; n = 41; L = 1;

x = linspace(0,L,n);
dx = x(2)-x(1);

f = @(x) x;
fx = f(x);

K = zeros(n-1,n-1);
d = zeros(n-1,1);

for i=1:n-1
    K(i,i) = -2;
    if i<n-1
        K(i+1,i)=1;
        K(i,i+1)=1;
    end
    d(i) = -dx^2*fx(i);
end

d(1) -= a;
d(n-1) -= (2*dx*gam/alf);

K(n-1,n-2) = 2;
K(n-1,n-1) = -(2 + 2*dx*bet/alf);

Vp = K\d;

Vn = zeros(1,n);
Vn(1)=a;
Vn(2:n)=Vp;

C2 = a;
C1 = 211/306;
Va = -x.^3/6 + C1*x + C2;

dif = Va - Vn;
erro = max(abs(dif));

printf("\n=== ROBIN ===\n");
printf("Erro máximo: %.6f\n", erro);

plot(x,Va,'b','LineWidth',2)
hold on
plot(x,Vn,'ro')
legend('Exata','Numérica')
grid on
