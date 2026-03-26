clc
clear
close all

a = 0; b = 3; N = 33;
dt = (b-a)/(N-1);
t = a:dt:b;

f = @(t) 2 + 3*t.^2;
v = f(t);

somair = 0; somait = 0; somais = 0;

for i = 1:N-1
    somair += v(i)*(t(i+1)-t(i));
    somait += (v(i)+v(i+1))*(t(i+1)-t(i))/2;
end

for i = 1:(N-1)/2
    somais += (v(2*i-1)+4*v(2*i)+v(2*i+1));
end

simpson = somais*dt/3;

exato = 33;

erro_r = abs(somair-exato);
erro_t = abs(somait-exato);
erro_s = abs(simpson-exato);

printf("\n=== INTEGRAÇÃO NUMÉRICA ===\n");
printf("Riemann:  %.6f | Erro: %.6f\n", somair, erro_r);
printf("Trapézio: %.6f | Erro: %.6f\n", somait, erro_t);
printf("Simpson:  %.6f | Erro: %.6f\n", simpson, erro_s);

plot(t,v,'LineWidth',2)
grid on
title('Função v(t)')
