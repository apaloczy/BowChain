function grid = proc_grid_chain_offsets(grid,config)

offsets = feval(config.chain_model,grid,config);

ship_speed = 0; %* placeholder


t_offset_total = zeros(size(grid.t));

flds = {'t','p','s'};

for i = 1:size(grid.t,1);
    % clock offsets
    if isfield(offsets,'clock')
        t_offset_total(i,:) = t_offset_total(i,:) + offsets.clock(i,:);
    end

    % positional offsets
    if isfield(offsets,'x')
        %* todo
    end


    % Apply offsets and shuffle data onto deployment base time
    grid_new = struct();
    perd_base = 1/(config.freq_base*86400);
    grid_new.dn = config.dn_range(1):perd_base:config.dn_range(2);
    for f = 1:length(flds)
        grid_new.(flds{f}) = interp1(grid.dn+t_offset_total(i,:),...
                                     grid.(flds{f})(i,:),...
                                     grid_new.dn,'nearest');
    end
end

