function config = preproc_raw2mat(config)
% Convert raw instrument data to .mat files

disp('Converting raw data to .mat files...')

sns = keys(config.sensors);
for i = 1:length(sns)
    sn = sns{i};
    [~,fname,fext] = fileparts(config.sensors(sn).file_raw);
    if ~exist(config.sensors(sn).file_mat)
        disp(['  ' fname fext ' --> ' fname '.mat'])
        data = feval(config.sensors(sn).parse_func,...
                     config.sensors(sn).file_raw);
        data.sn = sn;
        save(config.sensors(sn).file_mat,'-struct','data');
    else
        disp(['  ' fname '.mat' ' already exists'])
    end
end