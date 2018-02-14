%% check_config(config)
% Check a BowChain configuration structure for missing settings. Throw an error
% if required settings are missing; warn about missing optional requirements.

function check_config(cruise,config)

%% Check for missing required configuration
opts = {...
    % Required base options: 
    'name';
    'freq_base';
    'dir_raw';
    'dn_range';
    'sensor_sn';
    'sensor_pos';
    % Requried additional fields for certain options
    %   {option, value, required option}
    {'time_offset_method','cohere','cohere_interval'};
    {'time_offset_method','known_drift','time_synched'};
    {'time_offset_method','known_drift','drift'};
       };

desc = {'deployment name';
        'desired frequency for gridded data';
        'path to deployment''s raw data directory';
        'desired datenum range for gridded data';
        'cell array of sensor serial numbers (as strings)';
        'vector of sensor positions (m)';
        'datenum range for determining time offsets';
        'time that clocks were synched (datenum)';
        'measured clock drifts (seconds)';
       };
msg = '';
n_missing = 0;
for d = 1:length(config)
    for i = 1:length(opts)
        if ~iscell(opts{i});
            if ~isfield(config(d),opts{i}) || isempty(config(d).(opts{i}))
                msg = sprintf('%s\n  %s: %s (%s)',msg,config(d).name,opts{i},desc{i});
                n_missing = n_missing + 1;
            end
        else
            if isfield(config(d),opts{i}{1}) && ...
                    strcmp(config(d).(opts{i}{1}),opts{i}{2}) && ...
                    ~isfield(config(d),opts{i}{3})
                msg = sprintf('%s\n  %s: %s "%s" requires config field: "%s" (%s)',...
                              msg,config(d).name,opts{i}{1},opts{i}{2},opts{i}{3},desc{i});
                n_missing = n_missing + 1;
            end
        end                
    end
end
if n_missing > 0
    error('Missing deployment configuration for %s: %s',...
          cruise,msg);
end

%% Check for missing optional configuration
% TODO: consolidate this code
opts = {...
    'zero_pressure_interval';
    'file_gps';
       };

desc = {'Time interval to calibrate pressure (datenum)';
        'Location of GPS file';
       };
msg = '';
n_missing = 0;
for d = 1:length(config)
    for i = 1:length(opts)
        if ~iscell(opts{i});
            if ~isfield(config(d),opts{i}) || isempty(config(d).(opts{i}))
                msg = sprintf('%s\n  %s: %s (%s)',msg,config(d).name,opts{i},desc{i});
                n_missing = n_missing + 1;
            end
        else
            if isfield(config(d),opts{i}{1}) && ...
                    strcmp(config(d).(opts{i}{1}),opts{i}{2}) && ...
                    ~isfield(config(d),opts{i}{3})
                msg = sprintf('%s\n  %s: %s "%s" requires config field: "%s" (%s)',...
                              msg,config(d).name,opts{i}{1},opts{i}{2},opts{i}{3},desc{i});
                n_missing = n_missing + 1;
            end
        end                
    end
end
if n_missing > 0
    warning('Missing deployment configuration for %s: %s',...
            cruise,msg);
end




