function data = proc_load_mat(config)
data.sensors = containers.Map();

for sn_cell = keys(config.sensors)
    sn = char(sn_cell)
    [~,fname,fext] = fileparts(config.sensors(sn).file_mat);
    % disp(sprintf('Loaded %s',[fname fext]))
    %* Fill data structure here
    data.sensors(sn) = struct();
end    
    
