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
check_config(cruise,config)

%% Misc config structure processing
for d = 1:length(config)
    % Ensure the right shape for sensor_sn
    config(d).sensor_sn = reshape(config(d).sensor_sn,1,[]);
    % Add the cruise name to the config structure
    config(d).cruise = cruise;
end

