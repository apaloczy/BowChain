function gridded = cm_straight(gridded,cfg)

% Assume the chain shape is linear. Calculate vertical positions by
% interpolating pressure vs. position.
hasP = ~all(isnan(gridded.p),2);
if sum(hasP) > 1
    gridded.z = -interp1(gridded.pos(hasP),gridded.p(hasP,:),gridded.pos,'linear','extrap');
else    
    gridded.z = nan(size(gridded.x));
end

% Horizontal offsets from geometry
hyp2 = repmat(diff(gridded.pos).^2,1,numel(gridded.dn));
x = sqrt(hyp2 - diff(gridded.z).^2);
gridded.x = [zeros(size(gridded.dn)); cumsum(x)];