function data = proc_load_mat(config)
data.sensors = containers.Map();

sns = keys(config.files_mat);
for i = 1:length(sns)
    sn = sns{i};
    [~,fname,fext] = fileparts(config.files_mat(sn));
    disp(sprintf('Loaded %s',[fname fext]))
    %* Fill data structure here
    data.sensors(sn) = struct();
end    
    
