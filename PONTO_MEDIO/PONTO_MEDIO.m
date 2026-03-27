clc
clear
close all

a = 0; b = 3; N = 32;
h = (b-a)/N;

f = @(x) 2 + 3*x.^2;

soma = 0;

for i = 0:N-1
    xm = a + (i+0.5)*h;
    soma += f(xm);
end

I = soma*h;

exato = 33;
erro = abs(I - exato);

printf("\n=== PONTO MÉDIO ===\n");
printf("Integral: %.6f\n", I);
printf("Erro: %.6f\n", erro);
