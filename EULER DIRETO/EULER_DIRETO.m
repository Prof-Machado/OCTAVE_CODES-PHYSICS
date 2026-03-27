clc
clear
close all

a = 20;
L = 1; n = 41;

x = linspace(0,L,n);
dx = x(2)-x(1);

y = zeros(1,n);
z = zeros(1,n);

y(1)=a;
z(1)=0;

for i=1:n-1
    y(i+1)=y(i)+dx*z(i);
    z(i+1)=z(i)+dx*(-x(i));
end

plot(x,y,'b')
title('Euler')
grid on
