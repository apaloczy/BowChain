function gridded = proc_pressure_cal(gridded,cfg)

if isfield(cfg,'zero_pressure_interval')
    idx = gridded.dn>=cfg.zero_pressure_interval(1) & ...
          gridded.dn<=cfg.zero_pressure_interval(2);
    for i = 1:size(gridded.p,1)
        if ~all(isnan(gridded.p(i,:)))
            gridded.p(i,:) = gridded.p(i,:) - nanmean(gridded.p(i,idx));
        end
    end
    gridded.info.pressure_cal = sprintf(...
        ['Pressure zeroed on interval %s to %s'],...
        datestr(cfg.zero_pressure_interval(1)),...
        datestr(cfg.zero_pressure_interval(2)));
end

