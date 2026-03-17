fc = 1.88;
fp = 2.6465e-4;
l = 0.0492;
g = 9.81;
J = 0.0132;
mc = 0.605;
mp = 0.088;
a = l^2+J/(mc+mp);
mi = l*(mc+mp);
k = -14.4612*mc;

save 'parameters.mat'

xr = [0.364;0;0;0];
ur = 0;

[A, B, C] = partial_diff(xr, ur);

cart_wt = 1.5;
pend_wt = 1;

Q = diag([10^cart_wt, 10^pend_wt, 1, 1]);
R = 1;

K = lqr(A, B, Q, R);