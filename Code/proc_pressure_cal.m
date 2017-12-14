function grid = proc_pressure_cal(grid,cfg)

if isfield(cfg,'zerop_dn')
    idx = grid.dn>=cfg.zerop_dn(1) & grid.dn<=cfg.zerop_dn(2);
    for i = 1:size(grid.p,1)
        if ~all(isnan(grid.p(i,:)))
            grid.p(i,:) = grid.p(i,:) - nanmean(grid.p(i,idx));
        end
    end
    grid.info.pressure_cal = sprintf(...
        ['Pressure zeroed on interval %s to %s'],...
        datestr(cfg.zerop_dn(1)),...
        datestr(cfg.zerop_dn(2)));
end

