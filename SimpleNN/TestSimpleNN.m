
clear;

nlayer = 2;

tmp = struct();
tmp.W = [ 0.15,0.20; 0.25, 0.30 ];
tmp.b = [ 0.35; 0.35 ];
layers(1) = tmp;

tmp = struct();
tmp.W = [ 0.40,0.45; 0.50, 0.55 ];
tmp.b = [ 0.60; 0.60 ];
layers(2) = tmp;

train_in = [ 0.05,0.10 ]';
train_out = [ 0.01, 0.99 ]';

[y0,recs] = SimpleForward(layers, train_in);
err0 = SimpleLoss(train_out,y0)

resid = [];

for iter = 1:1000
    
    recs = SimpleBackward(layers,recs,train_in,train_out);
    
    % layers.W = recs.W;
    % layers.b = recs.b;
    layers = recs;
    
    [yout,recs] = SimpleForward(layers, train_in);
    err = SimpleLoss(train_out,yout);
    
    if mod(iter,10) == 0
        disp(['iter=',int2str(iter), ';resid=',num2str(err)]);
    end
    
    resid(end+1) = err;
end

figure;
plot(resid);

