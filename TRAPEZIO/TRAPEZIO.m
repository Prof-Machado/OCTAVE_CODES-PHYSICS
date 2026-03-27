clc
clear
close all

f = @(x) 2 + 3*x.^2;

a = 0; b = 3;
tol = 1e-6;

N = 2;
erro = 1;

I_old = 0;

while erro > tol
    h = (b-a)/N;
    x = a:h:b;

    soma = 0;
    for i = 2:N
        soma += f(x(i));
    end

    I = h*( (f(a)+f(b))/2 + soma );

    erro = abs(I - I_old);
    I_old = I;
    N = N*2;
end

printf("\n=== TRAPÉZIO ADAPTATIVO ===\n");
printf("Integral: %.6f\n", I);
printf("Iterações: %d\n", N);
printf("Erro estimado: %.6f\n", erro);
