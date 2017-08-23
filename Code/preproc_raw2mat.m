function config = preproc_raw2mat(config)

% Convert raw instrument data to .mat files
config.files_raw = containers.Map();
config.files_mat = containers.Map();
for i = 1:length(config.sensor_sn)
    sn = config.sensor_sn{i};
    % Associate a parsing function and file extension with a serialnum}
    [~,func, ext, status] = get_sensor_info(sn);
    if status==0 % found parsing func and file ext for serial
        fpath = fullfile(config.dir_raw,config.dir_deployment,sn);
        file_raw = dir([fpath '/*' ext]);
        if length(file_raw) == 1
            % Locate raw file
            fn_raw = file_raw.name;
            [~,fname,fext] = fileparts(fn_raw);
            fn_mat = [fname, '.mat'];
            disp([fn_raw ' -> ' fn_mat])
            fullfile_raw = fullfile(fpath,fn_raw);
            fullfile_mat = fullfile(fpath,fn_mat);
            config.files_raw(sn) = fullfile_raw;
            config.files_mat(sn) = fullfile_mat;
            %* Parse raw file
            % data = feval(func,fullfile_raw)
            % save(fullfile_mat,'-struct','data');
        else
            msg = '%d raw file(s) for instrument SN %s';
            disp(sprintf(msg,length(file_raw),sn));
        end
    end
end
