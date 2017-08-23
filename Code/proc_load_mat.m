function data = proc_load_mat(config)
data.sensors = containers.Map();

sns = keys(config.sensors);
for i = 1:length(sns)
    sn = sns{i};
    [~,fname,fext] = fileparts(config.sensors(sn).file_mat);
    % disp(sprintf('Loaded %s',[fname fext]))
    %* Fill data structure here
    data.sensors(sn) = struct();
end    
    
