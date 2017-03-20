function [layers] = SimpleBuild(nodelist)

nlayers = numel(nodelist) - 1;

for i = 1:nlayers
    nin = nodelist(i);
    nout = nodelist(i+1);
    
    tmp = struct();
    tmp.W = rand(nout,nin);
    tmp.b = rand(nout,1);
    
    layers(i) = tmp;
end

return
end

