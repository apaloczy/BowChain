function config = get_config(cruise,varargin)

%% Setup
% Get cruise configuration
cruise_file = fullfile(['Cruise_' cruise],['config_' cruise]);
if exist(cruise_file) == 2
    config = feval(['config_' cruise]);
else
    error('Cannot find file: %s.m',cruise_file)
end

% Fill default options
config = fill_defaults(config,config_default());

% Limit to deployment(s), if specified
if nargin > 1
    if ~iscell(varargin{1})
        varargin{1} = {varargin{1}};
    end
    config = config(ismember({config.name},varargin{1}));
end

%% Check for missing options
opts = {'freq_base';
        'dir_raw';
        'dn_range';
        'sensor_sn';
        'sensor_pos'};
desc = {'Desired frequency for gridded data';
        'Path to deployment''s raw data directory';
        'Desired datenum range for gridded data';
        'Cell array of sensor serial numbers (as strings)';
        'Vector of sensor positions (m)'};
msg = '';
n_missing = 0;
for d = 1:length(config)
    for i = 1:length(opts)
        if ~isfield(config(d),opts{i}) || isempty(config(d).(opts{i}))
            msg = sprintf('%s\n  %s: %s (%s)',msg,config(d).name,opts{i},desc{i});
            n_missing = n_missing + 1;
        end
    end
end
if n_missing > 0
    error('Missing deployment configuration in %s.m:%s',...
          cruise_file,msg);
end

%% Misc config structure processing

for d = 1:length(config)
    % Ensure the right shape for sensor_sn
    config(d).sensor_sn = reshape(config(d).sensor_sn,1,[]);
    % Add the cruise name to the config structure
    config(d).cruise = cruise;
end

