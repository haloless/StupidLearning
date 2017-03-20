function [ y,recs ] = SimpleForward(layers,x)

nlayer = numel(layers);

recs = struct();

for i = 1:nlayer
    u = layers(i).W * x + repmat(layers(i).b,1,size(x,2));
    [y,g] = ActFunc(u);
    
    tmp = struct();
    tmp.x = x;
    tmp.y = y;
    tmp.g = g;
    if i == 1
        recs = tmp;
    else
        recs(i) = tmp;
    end
    
    x = y;
end




return
end

