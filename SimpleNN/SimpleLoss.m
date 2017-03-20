function [etot] = SimpleLoss(t,y)

etot = 0.5 * sum((t(:)-y(:)).^2);

return
end
