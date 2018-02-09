function config = preproc_raw2mat(config)
% Convert raw instrument data to .mat files

disp('Converting raw data to .mat files...')

for i = 1:length(config.sensors)
    [~,fname,fext] = fileparts(config.sensors(i).file_raw);
    if ~exist(config.sensors(i).file_mat)
        disp(['  ' fname fext ' --> ' fname '.mat'])
        data = feval(config.sensors(i).parse_func,...
                     config.sensors(i).file_raw);
        data.sn = sn;
        save(config.sensors(i).file_mat,'-struct','data');
    else
        disp(['  ' fname '.mat' ' already exists'])
    end
end
