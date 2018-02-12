function data = proc_load_mat(config)
data = {};

disp('Loading raw data from .mat files...')
for i = 1:length(config.sensors)
    data{i} = load(config.sensors(i).file_mat);
    msg = '  Loaded data from %s [%s]';
    disp(sprintf(msg,config.sensors(i).sensor_type,config.sensors(i).sn))
end
