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

%% Check for missing options
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

