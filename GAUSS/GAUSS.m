clc
clear
close all

% Função
f = @(x) 2 + 3*x.^2;

% Intervalo
a = 0; b = 3;

% Mudança de variável para [-1,1]
g = @(t) f((b-a)/2 * t + (a+b)/2);

% Pontos e pesos (2 pontos)
t1 = -1/sqrt(3);
t2 =  1/sqrt(3);

w1 = 1;
w2 = 1;

% Integral
I = (b-a)/2 * ( w1*g(t1) + w2*g(t2) );

% Exato
exato = 33;
erro = abs(I - exato);

printf("\n=== GAUSS-LEGENDRE ===\n");
printf("Integral: %.6f\n", I);
printf("Erro: %.6f\n", erro);
