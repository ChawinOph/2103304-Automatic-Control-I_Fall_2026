clear; clc;
a = [1 1 0];
b = [1 4 16];
den = conv(a,b);
num = [1 3];

sys_tf = tf(num,den)

% Plot and capture line handles
[r,k] = rlocus(sys_tf);

v = [-6 6 -6 6];
axis equal;
axis(v);
grid on;

mydata = []; % To populate the data
for i=1:size(r,1)
    mydata(:,2*i -1) = (real(r(i,:))).'; % CL eig Real Part
    mydata(:,2*i)    = (imag(r(i,:))).'; % CL eig Imag Part
end
mydata(:,2*size(r,1)+1) = k'; % The gain array

%%
% (*
% Source - https://tex.stackexchange.com/a/213255
% Posted by percusse, modified by community. See post 'Timeline' for change history
% Retrieved 2026-05-21, License - CC BY-SA 3.0
% *)

% state space model
sys = rss(5); % Stable system with 5 eigs
e = esort(eig(sys)) % Sort the eigenvalues with possibly complex entries

coeffs = poly(sys.A)   % coefficients of det(sI - A)
% Convert to Transfer Function
sys_tf = tf(sys)

% Example: coeffs = [1, a1, a2, ..., an] for s^n + a1*s^(n-1) + ... + an
% sys.a = sys.a - eye(5)*0.95*real(e(1)); % Make it closer to imaginary axis
[r,k] = rlocus(sys); % Get the data without plotting
rlocus(sys)

mydata = []; % To populate the data
for i=1:5
    mydata(:,2*i -1) = (real(r(i,:))).'; % CL eig Real Part
    mydata(:,2*i)    = (imag(r(i,:))).'; % CL eig Imag Part
end
mydata(:,11) = k'; % The gain array

A_sym = sym(sys.A);           % convert numeric A to symbolic
syms s
poly_s = charpoly(A_sym, s)  % returns symbolic polynomial in s
% or get coefficients vector: coeffs_sym = charpoly(A_sym);