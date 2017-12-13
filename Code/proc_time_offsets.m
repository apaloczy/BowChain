function grid = proc_time_offsets(grid,data,cfg)

switch cfg.time_offset_method
  case 'known_drift'
    % Correct for a measured clock drift
    data = time_offsets_known_drift(data,cfg);
    grid = proc_grid_init(data,cfg); % resample with offsets applied
  case 'cohere'
    data = time_offsets_cohere(grid,data,cfg);
    grid = proc_grid_init(data,cfg);
    grid.info = cat(1,grid.info,sprintf(...
        ['Time offsets determined using "cohere" method'...
         ' on interval %s to %s'],...
        datestr(cfg.cohere_interval(1)),...
        datestr(cfg.cohere_interval(2))));
  otherwise
    disp('No time offsets applied')
end
