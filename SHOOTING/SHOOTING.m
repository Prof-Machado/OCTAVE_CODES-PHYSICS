clc
clear
close all

a = 20; b = 3140/153;
L = 1; n = 41;

x = linspace(0,L,n);
dx = x(2)-x(1);

f = @(x,y,z) [z; -x]; % y' = z, z' = -x

% chute inicial
s1 = 0; s2 = 10;

for k=1:20

    % integração com Euler
    y1 = zeros(1,n); z1 = zeros(1,n);
    y1(1)=a; z1(1)=s1;

    for i=1:n-1
        y1(i+1)=y1(i)+dx*z1(i);
        z1(i+1)=z1(i)+dx*(-x(i));
    end

    y2 = zeros(1,n); z2 = zeros(1,n);
    y2(1)=a; z2(1)=s2;

    for i=1:n-1
        y2(i+1)=y2(i)+dx*z2(i);
        z2(i+1)=z2(i)+dx*(-x(i));
    end

    % correção
    s = s2 - (y2(end)-b)*(s2-s1)/(y2(end)-y1(end));

    s1 = s2;
    s2 = s;
end

Vn = y2;

plot(x,Vn,'r')
title('Shooting Method')
grid on
