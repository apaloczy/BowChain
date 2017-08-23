function data = proc_load_mat(config)
data = containers.Map();

disp('Loading raw data from .mat files...')
for sn_cell = keys(config.sensors)
    sn = char(sn_cell);
    data(sn) = load(config.sensors(sn).file_mat);
    msg = '  Loaded data from %s [%s]';
    disp(sprintf(msg,config.sensors(sn).sensor_type,sn))
end    
    
