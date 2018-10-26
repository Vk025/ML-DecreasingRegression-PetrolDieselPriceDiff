thetaN = inv(X'*X)*X'*y %gives more or less close theta value
EqualDayN = ceil(-thetaN(1)/thetaN(2))
