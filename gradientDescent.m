function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
J_history = zeros(num_iters, 1);
m = length(y); % number of training examples
 for iter = 1:num_iters
     
     theta=theta-alpha*(X'*(X*theta-y))/m;
     
     % Save the cost J in every iteration    
     J_history(iter) = computeCost(X, y, theta);
    fprintf('\n Value of Cost function after %d th iteration is %f ', iter, J_history(iter));
    
 end
end