function gridded = proc_time_offsets(gridded,data,cfg)

switch cfg.time_offset_method
  case 'known_drift'
    % Correct for a measured clock drift
    data = time_offsets_known_drift(data,cfg);
    gridded = proc_grid_init(data,cfg); % resample with offsets applied
  case 'cohere'
    data = time_offsets_cohere(gridded,data,cfg);
    gridded = proc_grid_init(data,cfg);
  otherwise
    disp('No time offsets applied')
end
