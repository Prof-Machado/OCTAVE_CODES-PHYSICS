clc
clear
close all

% Parâmetros
n = 41;
L = 1;
a = 20;
b = 3140/153;

x = linspace(0,L,n);
dx = x(2)-x(1);

% Inicialização
K = zeros(n,n);
F = zeros(n,1);

% Montagem FEM (linear 1D)
for i = 1:n-1

    Ke = (1/dx)*[1 -1; -1 1];
    Fe = dx/2 * [x(i); x(i+1)];

    K(i:i+1,i:i+1) += Ke;
    F(i:i+1) += Fe;
end

% Condições de contorno (Dirichlet)
K(1,:) = 0; K(1,1) = 1; F(1) = a;
K(n,:) = 0; K(n,n) = 1; F(n) = b;

% Solução
V = K \ F;

% Solução analítica
C2 = a;
C1 = 211/306;
Va = -x.^3/6 + C1*x + C2;

% Erro
erro = max(abs(V' - Va));

printf("\n=== FEM ===\n");
printf("Erro máximo: %.6f\n", erro);

% Gráfico
plot(x,Va,'b','LineWidth',2)
hold on
plot(x,V,'ro')
legend('Exata','FEM')
grid on
