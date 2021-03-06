function data = proc_time_offsets(data,cfg)

% Compute offsets
apply_offsets = true;
switch cfg.time_offset_method
  case 'known_drift'
    % Correct for a measured clock drift
    offsets = time_offsets_known_drift(data,cfg);
  case 'known_offsets'
    % Correct for known clock offsets
    offsets = cfg.time_offsets./86400;
  case 'cohere'
    fprintf('Calibrating clocks over interval: %s,%s\n',...
                 datestr(cfg.cohere_interval(1)),...
                 datestr(cfg.cohere_interval(2)));
    % Sample data over cohere interval
    tcalgrid = proc_grid_init(data,cfg,cfg.cohere_interval);
    % compute and apply offsets to raw data
    offsets = time_offsets_cohere(tcalgrid,data,cfg);
    close all
  case 'onestep'
    % Correct assuming step function in data
    fprintf('Calibrating clocks over interval: %s,%s\n',...
                 datestr(cfg.time_offset_interval(1)),...
                 datestr(cfg.time_offset_interval(2)));
    % Sample data over cohere interval
    tcalgrid = proc_grid_init(data,cfg,cfg.time_offset_interval);
    % compute and apply offsets to raw data
    offsets = time_offsets_onestep(tcalgrid);
    close all
  otherwise
    disp('No time offsets applied')
    apply_offsets = false;
end

% Apply offsets
if apply_offsets
    for i = 1:length(data)
        data{i}.dn = data{i}.dn + offsets(i);
        fprintf('Removed %.2fs time offset from %s\n',...
                     offsets(i)*86400,data{i}.sn)
    end
end
