function J = computeCostMulti(X, y, theta)
  % calling computeCost() also works, but the exercise asked to implement it
  % like this...
  % J = computeCost(X, y, theta)
  m=length(y);
  J =  1 / (2 * m) * (X * theta - y)' * (X * theta - y);
end
