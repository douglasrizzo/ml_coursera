function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
  %GRADIENTDESCENT Performs gradient descent to learn theta
  %   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by
  %   taking num_iters gradient steps with learning rate alpha

  % Initialize some useful values
  m = length(y); % number of training examples
  n = size(X, 2); % number of features also needed in this imlplementation
  J_history = zeros(num_iters, 1);

  % This line normalizes training features, ignoring x_0 which is always one
  % X(:, 2:end) = featureNormalize(X(:, 2:end))

  for iter = 1 : num_iters
    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta.
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    % calculate the hypothesis function
    h = X * theta;
    % derivatives: here multiplying by the transpose of X has the same effect as
    % using sum() and mutiplying by each column of X
    d = (X' * (h - y)) / m;
    theta = theta - alpha * d;
    % ============================================================
    % Save the cost J in every iteration
    J_history(iter) = computeCost(X, y, theta);
  end
end
