function [theta] = normalEqnReg(X, y, lambda)
%NORMALEQN Computes the closed-form solution to linear regression
%   NORMALEQN(X,y) computes the closed-form solution to linear
%   regression using the normal equations.

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the code to compute the closed form solution
%               to linear regression and put the result in theta.
%
L = eye(length(y))
L(1) = 0
theta = pinv(X' * X + lambda * L) * X' * y;
% ============================================================

end
