function grid = cm_straight(grid,cfg)

% Assume the chain is completely straight. Calculate vertical positions by
% interpolating pressure vs. position.
hasP = ~all(isnan(grid.p),2);
grid.z = -interp1(grid.pos(hasP),grid.p(hasP,:),grid.pos,'linear','extrap');
grid.x = zeros(size(grid.x));

% dl = diff(grid.pos*ones(1,length(grid.dn)));
% dz = diff(grid.z);
% dl = max(dl,dz);

