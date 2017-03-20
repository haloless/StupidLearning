
clear;

%
layers = SimpleBuild([2,3,3,1]);

% tmp = struct();
% tmp.W = rand(2,3)';
% tmp.b = rand(1,3)';
% layers(1) = tmp;

% tmp = struct();
% tmp.W = rand(3,3)';
% tmp.b = rand(1,3)';
% layers(end+1) = tmp;

% % tmp = struct();
% % tmp.W = rand(2,2)';
% % tmp.b = rand(1,2)';
% % layers(end+1) = tmp;

% tmp = struct();
% tmp.W = rand(3,1)';
% tmp.b = rand(1,1)';
% layers(end+1) = tmp;

nlayers = numel(layers);
disp(['nlayers=',int2str(nlayers)]);

%% AND
% train = [ ...
% 0, 0, 0; 
% 0, 1, 0;
% 1, 0, 0;
% 1, 1, 1];

%% OR
% train = [ ...
% 0, 0, 0; 
% 0, 1, 1;
% 1, 0, 1;
% 1, 1, 1];

%% XOR
train = [ ...
0, 0, 0; 
0, 1, 1;
1, 0, 1;
1, 1, 0];

% set train data
train_in = train(:,1:2)';
train_out = train(:,3)';

[y0,recs] = SimpleForward(layers, train_in);
err0 = SimpleLoss(train_out,y0)

resid = [];

for iter = 1:8000
    
    recs = SimpleBackward(layers,recs,train_in,train_out);
    
    % layers.W = recs.W;
    % layers.b = recs.b;
    layers = recs;
    
    [yout,recs] = SimpleForward(layers, train_in);
    err = SimpleLoss(train_out,yout);
    
    if mod(iter,500) == 0
        disp(['iter=',int2str(iter), ';resid=',num2str(err)]);
    end
    
    resid(end+1) = err;
end

figure;
plot(resid);

