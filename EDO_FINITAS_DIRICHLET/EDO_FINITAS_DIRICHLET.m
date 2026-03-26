clc
clear
close all

a = 20; b = 3140/153;
n = 41; L = 1;

x = linspace(0,L,n);
dx = x(2)-x(1);

f = @(x) x;
fx = f(x);

K = zeros(n-2,n-2);
d = zeros(n-2,1);

for i=1:n-2
    K(i,i) = -2;
    if i<n-2
        K(i+1,i)=1;
        K(i,i+1)=1;
    end
    d(i) = -dx^2*fx(i+1);
end

d(1) -= a;
d(n-2) -= b;

Vp = K\d;

Vn = zeros(1,n);
Vn(1)=a;
Vn(2:n-1)=Vp;
Vn(n)=b;

C2 = a;
C1 = 211/306;
Va = -x.^3/6 + C1*x + C2;

dif = Va - Vn;
erro = max(abs(dif));

printf("\n=== DIRICHLET ===\n");
printf("Erro máximo: %.6f\n", erro);

plot(x,Va,'b','LineWidth',2)
hold on
plot(x,Vn,'ro')
legend('Exata','Numérica')
grid on
