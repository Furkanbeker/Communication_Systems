
% c1 = 6 , c2= 4
R = 6;
C = 4 * 1e-3;
RC = R * C;

% H(s) = 1 / (RCs + 1)
s = tf('s');
H = 1 / (RC*s + 1);

bode(H);
title('RC Low Pass Filter');
grid on;
