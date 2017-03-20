function [ f,g ] = ActFunc(x)

% logistic
expnx = exp(-x);
f = 1.0 ./ (1 + expnx);
% g = expnx ./ (1+expnx).^2;
g = (1-f) .* f;


return
end

