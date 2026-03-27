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

    k1y = z(i);
    k1z = -x(i);

    k2y = z(i) + dx*k1z/2;
    k2z = -(x(i)+dx/2);

    k3y = z(i) + dx*k2z/2;
    k3z = -(x(i)+dx/2);

    k4y = z(i) + dx*k3z;
    k4z = -(x(i)+dx);

    y(i+1)=y(i)+dx*(k1y+2*k2y+2*k3y+k4y)/6;
    z(i+1)=z(i)+dx*(k1z+2*k2z+2*k3z+k4z)/6;
end

plot(x,y,'k')
title('Runge-Kutta 4')
grid on
