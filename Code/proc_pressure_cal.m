function grid = proc_pressure_cal(grid,cfg)

if isfield(cfg,'zero_pressure_interval')
    idx = grid.dn>=cfg.zero_pressure_interval(1) & ...
          grid.dn<=cfg.zero_pressure_interval(2);
    for i = 1:size(grid.p,1)
        if ~all(isnan(grid.p(i,:)))
            grid.p(i,:) = grid.p(i,:) - nanmean(grid.p(i,idx));
        end
    end
    grid.info.pressure_cal = sprintf(...
        ['Pressure zeroed on interval %s to %s'],...
        datestr(cfg.zero_pressure_interval(1)),...
        datestr(cfg.zero_pressure_interval(2)));
end

