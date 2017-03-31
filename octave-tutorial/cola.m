x=ones(10, 1)
x=magic(3)
x=zeros(10, 1)

A=[1 2; 3 4; 5 6]
B=[0 0; 1 2]

A(1)
A(2, :)
A(:, 2)
A([1 3], :)
A'
size(A)
size(size(A))
length(A)
length(A')

A * B
A * B'
A * B
B .* A([1 3], :)
2 * A
-A
-1 * A

I = eye(5)
fliplr(I)
flipud(I)

[A; [7 8]]
[A [7; 8; 9]]

C = [7 8]
[A; C]
C = [7; 8; 9]
A = [A C]

inv(A)
pinv(A)

A > 6
A <= 3
A(A <= 6)

for i = 1 : 10,
  x(i) = 2 ^ i;
end
x

i = 1;
while true
  x(i) = 999;
  i = i + 1;
  if i == 6
    break;
  end;
end;
x

if x(1) == 1
  disp('the value is one')
elseif x(1) == 2
  disp('the value is two')
else
  disp('the value is neither one nor two')
end;

rand(3)
rand(3, 1)
rand(1, 3)
randn(1, 3)
randn(3, 1)

% save the entire workspace
save 'mydata'
save -ascii 'mydata.txt'
save -zip 'mydata.zip'
save -mat 'mydata.mat'
save -binary 'mydata.oct'
save -hdf5 'mydata.hdf5'

v = randn(100);
% save the entire workspace
save 'myvar' v
save -ascii 'myvar.txt' v
save -zip 'myvar.zip' v
save -mat 'myvar.mat' v
save -binary 'myvar.oct' v
save -hdf5 'myvar.hdf5' v

r1 = squareThisNumber(A)
[r1, r2] = squareAndCubeThisNumber(A, B)
