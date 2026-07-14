% sample matlab code
a = [1 1 0]; s = 'abcd';
b = [1 4 16];
den = conv(a,b); num = [1 3];
rlocus(num, den);
v = [-6 6 -6 6]; axis equal; 
axis(v);
grid on;
!mv test.txt test2.txt
A = [1, 2, 3;... foo
     4, 5, 6];
s = 'abcd';
for k = 1:4
  Disp(s(k)) % bar
end
x = linspace(0,1,101);
y = x(end:-1:1);