function sensor_dir = sensor_dirs_CANAPE(config,sn)

[sensor_type,~,~,status] = get_sensor_info(sn);

switch sensor_type
  case 'SBE56'
    sensor_dir = fullfile(config.dir_raw,'SB56s/');
  case 'RBR Solo'
    sensor_dir = fullfile(config.dir_raw,'RBRdata/');
end
