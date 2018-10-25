function J = computeCost(X, y, theta)
J = 0;
m = length(y); % number of training examples

prediction=X*theta;
sqErrors=(prediction-y).^2;
J=(sum(sqErrors))/(2*m);

end