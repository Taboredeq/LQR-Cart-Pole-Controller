function [Ar, Br, Cr] = partial_diff(xr, ur) 

load 'stale.mat'
syms x1 x2 x3 x4 u

x = [x1; x2; x3; x4];

d1 = x3;
d2 = x4;
d3 = (a*(u-mi*(x4^2)*sin(x2)-fc*x3)+l*cos(x2)*(mi*g*sin(x2)-fp*x4))/(J-mi*l*cos(x2)^2);
d4 = (l*cos(x2)*(u-mi*(x4^2)*sin(x2)-fc*x3)+mi*g*sin(x2)-fp*x4)/(J-mi*l*cos(x2)^2);
dx = [d1;d2;d3;d4];

h = [x1; x2; x3; x4];

A = jacobian(dx,x);
B = jacobian(dx,u);
C = jacobian(h, x);

Ar = double(subs(A,[[x1,x2,x3,x4], u],[xr', ur]));
Br = double(subs(B,[[x1,x2,x3,x4], u],[xr', ur]));
Cr = double(subs(C,[[x1,x2,x3,x4], u],[xr', ur]));
end
