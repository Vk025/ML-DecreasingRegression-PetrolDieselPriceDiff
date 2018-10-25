%% The goal is to predict when petrol and diesel price will level in the near future
%% given the petrol and diesel price history. This will be a decreasing linear regression problem.
%Initialization
close all; clear ; clc
% Date: 24th October 2018
%We shall consider the petrol and diesel price in Chennai city over the
%past 27 days,i.e., 27th September 2018-23th October 2018.
%Formatting Data (Prices in Rs/Litre)
PetrolPrice = [86.28 86.51 86.70 86.80 87.05 87.18 87.18 87.33 84.70 84.89 85.04 85.26 85.50 85.50 85.61 85.73 85.92 85.99 85.99 85.99 86.10 85.88 85.88 85.22 84.96 84.64 84.53]';
DieselPrice = [78.49 78.69 78.91 79.08 79.40 79.57 79.57 79.89 77.11 77.42 77.73 78.04 78.35 78.61 78.90 79.29 79.51 79.71 79.80 79.80 80.04 79.93 79.93 79.69 79.51 79.22 79.15]';
y = PetrolPrice-DieselPrice; %Output variable
m = length(y); % no.of training examples = 27 as we consider 27-day period
x = [1:27]'; % Input(date) will be taken as Day no.

%Plotting Data
figure;

plot(x, y, 'rx', 'MarkerSize', 10);
ylabel('Petrol and Diesel Price Difference in Rs./Litre');
xlabel('Day Number');
pause;
%%  Computing Cost & Minimizing it

X = [ones(m, 1) x]; % Add a column of ones to x
theta = [7;-1]; % Initializing parameters

%fprintf('\nTesting the cost function...\n')

%J = computeCost(X, y, theta);
%fprintf('With theta = [2.5 ; -1]\nCost computed = %f\n', J);

%J = computeCost(X, y, [7 ; -1]);
%fprintf('\nWith theta = [7 ; -1]\nCost computed = %f\n', J);

%Gradient Descent settings
alpha = 0.0077;
iterations = 2121;

fprintf('\nRunning Gradient Descent...\n')
theta = gradientDescent(X, y, theta, alpha, iterations);

% print theta to screen
fprintf('\nTheta found by gradient descent:\n');
fprintf('%f\n', theta);

% Plot the linear fit
hold on; 
plot(X(:,2), X*theta, 'b-')
legend('Training data', 'Linear regression')
hold off 

%Based on the best value of theta found, predict the day when petrol and
%diesel price will level in Chennai city.
EqualDay = ceil(-theta(1)/theta(2));

fprintf('Thus it is predicted Petrol and diesel prices will level in Chennai city on the %d th Day from today\n', EqualDay);


