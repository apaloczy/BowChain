function gridded = cm_straight(gridded,cfg)

% Assume the chain is completely straight. Calculate vertical positions by
% interpolating pressure vs. position.
hasP = ~all(isnan(gridded.p),2);
gridded.z = -interp1(gridded.pos(hasP),gridded.p(hasP,:),gridded.pos,'linear','extrap');
gridded.x = zeros(size(gridded.x));

% dl = diff(gridded.pos*ones(1,length(gridded.dn)));
% dz = diff(gridded.z);
% dl = max(dl,dz);

