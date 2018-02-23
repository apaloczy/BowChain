function gridded = proc_time_offsets(data,cfg)

switch cfg.time_offset_method
  case 'known_drift'
    % Correct for a measured clock drift
    data = time_offsets_known_drift(data,cfg);
    gridded = proc_grid_init(data,cfg); % resample with offsets applied
  case 'cohere'
    % preliminarily grid data over cohere interval
    pgrid = proc_grid_init(data,cfg,cfg.cohere_interval);
    % compute and apply offsets to raw data
    data = time_offsets_cohere(pgrid,data,cfg);
    % resample over deployment time interval
    gridded = proc_grid_init(data,cfg);
  otherwise
    disp('No time offsets applied')
end
