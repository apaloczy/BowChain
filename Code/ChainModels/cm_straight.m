function offsets = cm_straight(grid,config)
% Assume a vertical bow-chain moving through vertically uniform features.
% Instruments can move up and down, but any signal offsets must be from clock
% offsets only - as if everything is attached to a spring on a pole.

offsets.clock = zeros(size(grid.t,1),1);

for i = 2:length(offsets.clock)
  % Get time offset
  offsets.clock(i) = determine_t_offset(grid.dn',grid.t(i-1,:)',...
                                    grid.dn',grid.t(i,:)',config.dn_range);
end
offsets.clock = cumsum(offsets.clock);



