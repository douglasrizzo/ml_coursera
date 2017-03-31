function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices.
%
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);

% You need to return the following variables correctly
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% create one-hot encoding for the classes
Y = (eye(max(y))(y,:));

% add one to the input
A1 = [ones(size(X, 1), 1) X];

% calculate the sigmoid outputs of layer 1
Z2 = A1 * Theta1';
% add the bias to layer 1 output
A2 = [ones(size(Z2, 1), 1) sigmoid(Z2)];

% calculate the sigmoid outputs of layer 2
Z3 = A2 * Theta2';
H = A3 = sigmoid(Z3);

% regularization parameter for the cost function
regularization = lambda / (2 * m) * (sum(sum(Theta1(:, 2:end).^ 2, 2)) + sum(sum(Theta2(:, 2:end).^ 2, 2)));

% cost function
J = sum(sum((-Y).*log(H) - (1 - Y).*log(1 - H), 2)) / m + regularization;

% accumulated derivatives for the weights
Sigma_3 = A3 - Y;
Sigma_2 = (Sigma_3 * Theta2 .* sigmoidGradient([ones(size(Z2, 1), 1) Z2]))(:, 2:end);
Delta_2 = Sigma_3' * A2;
Delta_1 = Sigma_2' * A1;

% gradients for individual weights with regularization
% zeros added to compensate for the biases and then removed
Theta2_grad = Delta_2 / m + (lambda / m) * [zeros(size(Theta2, 1), 1) Theta2(:, 2:end)];
Theta1_grad = Delta_1 / m + (lambda / m) * [zeros(size(Theta1, 1), 1) Theta1(:, 2:end)];
% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];
end
