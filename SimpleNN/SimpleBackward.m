function [recs] = SimpleBackward(layers,recs,xtrain,ytrain)

% TODO multiple train data
if size(xtrain,2) ~= 1
    % error('currently only single train data');
end

eta = 0.5;

nlayer = numel(layers);

for i = nlayer:-1:1
    % if i == nlayer
        % % the last layer
        % x = recs(i).x;
        % y = recs(i).y;
        % g = recs(i).g;
        
        % yerr = ytrain - y;
        % db = yerr .* g;
        % dW = db * x';
    % else
        % %
        % db = (layers(i+1).W' * recs(i+1).db) .* recs(i).g;
        % dW = db * recs(i).x';
    % end
    
    if i == nlayer
        % the last layer
        yerr = ytrain - recs(i).y;
        dd = yerr .* recs(i).g;
    else
        %
        dd = (layers(i+1).W' * recs(i+1).dd) .* recs(i).g;
    end
    
    db = sum(dd,2);
    dW = dd * recs(i).x';
    
    recs(i).dd = dd;
    recs(i).db = db;
    recs(i).dW = dW;
    
    recs(i).b = layers(i).b + eta.*db;
    recs(i).W = layers(i).W + eta.*dW;
end


return
end

