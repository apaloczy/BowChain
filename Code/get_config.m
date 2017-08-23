function config = get_config(cruise,dep)

% Get default options
config = struct();
config.cruise = cruise;
config.dep = dep;
config_default();

% Get cruise-specific options
cruise_file = fullfile(['Cruise_' cruise],['config_' cruise]);
if exist(cruise_file) == 2
    feval(['config_' cruise])
else
    error('Cannot find file: %s.m',cruise_file)
end

% Check for missing options
opts = {'freq_base';
        'dir_raw';
        'dir_deployment';
        'dn_range';
        'sensor_sn';
        'sensor_pos'};
msg = '';
n_missing = 0;
for i = 1:length(opts)
    if ~isfield(config,opts{i})
        msg = sprintf('%s\n  %s',msg,opts{i});
        n_missing = n_missing + 1;
    end
end
if n_missing > 0
    error('Missing configuration for deployment "%s" in %s.m:%s',...
          dep,cruise_file,msg);
end

config.sensor_sn = reshape(config.sensor_sn,1,[]);