%% config = get_config(cruise,varargin)
%
% Run the cruise's configuration file, fill with default values where necessary,
% and scan for missing configuration options

function config = get_config(cruise,varargin)

%% Setup
% Get cruise configuration
cruise_file = fullfile(['Cruise_' cruise],['config_' cruise]);
if exist(cruise_file) == 2
    config = feval(['config_' cruise]);
else
    error('Cannot find file: %s.m',cruise_file)
end
flds = fields(config);

% Fill default options
defaults = config_default();
config = fill_defaults(config,config_default());

% Notify about options that were filled
newflds = setdiff(fields(config),flds);
for i = 1:length(newflds)
    if isnumeric(defaults.(newflds{i}));
        fldfmt = '%.2f';
    else
        fldfmt = '%s';
    end
    msgfmt = ['Field "%s" not specified. Using default value: ' fldfmt];
    disp(sprintf(msgfmt,newflds{i},defaults.(newflds{i})));
end

% Limit to deployment(s), if specified
if nargin > 1
    if ~iscell(varargin{1})
        varargin{1} = {varargin{1}};
    end
    config = config(ismember({config.name},varargin{1}));
end

%% Check for missing configuration settings

% Missing optional settings
opts_optional = struct();
opts_optional(1).name = 'zero_pressure_interval';
opts_optional(2).name = 'file_gps';
%
opts_optional(1).desc = 'Time interval to calibrate pressure (datenum)';
opts_optional(2).desc = 'Location of GPS file';
%
check_config(cruise,config,opts_optional,'optional')

% Missing required settings
opts = struct();
opts(1).name = 'name';
opts(2).name = 'freq_base';
opts(3).name = 'dir_raw';
opts(4).name = 'dn_range';
opts(5).name = 'sensor_sn';
opts(6).name = 'sensor_pos';
% Requried additional fields for certain options
%   {option, value, required option}
opts(7).name = {'time_offset_method','cohere','cohere_interval'};
opts(8).name = {'time_offset_method','known_drift','time_synched'};
opts(9).name = {'time_offset_method','known_drift','drift'};
%
opts(1).desc = 'deployment name';
opts(2).desc = 'desired frequency for gridded data';
opts(3).desc = 'path to deployment''s raw data directory';
opts(4).desc = 'desired datenum range for gridded data';
opts(5).desc = 'cell array of sensor serial numbers (as strings)';
opts(6).desc = 'vector of sensor positions (m)';
opts(7).desc = 'datenum range for determining time offsets';
opts(8).desc = 'time that clocks were synched (datenum)';
opts(9).desc = 'measured clock drifts (seconds)';
%
check_config(cruise,config,opts,'required')

%% Misc config structure processing
for d = 1:length(config)
    % Ensure the right shape for sensor_sn
    config(d).sensor_sn = reshape(config(d).sensor_sn,1,[]);
    % Add the cruise name to the config structure
    config(d).cruise = cruise;
end
