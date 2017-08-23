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
end

config.sensor_sn = reshape(config.sensor_sn,1,[]);