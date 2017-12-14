function data = time_offsets_cohere(grid,data,cfg);

offsets = zeros(size(grid.t,1),1);
for i = 2:length(offsets)
  % Get time offset
  offsets(i) = determine_t_offset(grid.dn',grid.t(i-1,:)',...
                                  grid.dn',grid.t(i,:)',cfg.cohere_interval);
end
offsets = cumsum(offsets);

sns = keys(data);
for i = 1:length(sns)
    sn = sns{i};
    d = data(sn);
    d.dn = d.dn + offsets(i);
    data(sn) = d;
    disp(sprintf('Removed %.1f second offset from %s',offsets(i)*86400,sn));
    close all
end

