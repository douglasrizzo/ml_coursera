function grad = grad(theta, X, y, lambda)
  h = X * theta;
  [m, n] = size(X);
  grad = zeros(n, 1);

  original_d = (X' * (h - y)) / m;
  grad(1) = original_d(1);
  grad(2 : end) = original_d(2 : end) + lambda / m * theta(2 : end);
endfunction
