function config = preproc_setup(config);

disp('Gathering sensor information...')
config.sensors = containers.Map();
for i = 1:length(config.sensor_sn)
    sn = config.sensor_sn{i};
    % Associate a parsing function and file extension with a serialnum}
    [inst, func, ext, status] = get_sensor_info(sn);
    if status==0 % found parsing func and file ext for serial
        fpath = fullfile(config.dir_raw,config.dir_deployment,sn);
        file_raw = dir([fpath '/*' ext]);
        if length(file_raw) == 1
            % Locate raw file
            fn_raw = file_raw.name;
            [~,fname,fext] = fileparts(fn_raw);
            fn_mat = [fname, '.mat'];
            config.sensors(sn) = struct(...
                'file_raw', fullfile(fpath,fn_raw),...
                'file_mat', fullfile(fpath,fn_mat),...
                'sensor_type', inst,...
                'parse_func', func);
            msg = '  1 raw file for %s %s';
            disp(sprintf(msg,inst,sn));
        else
            msg = '  %d raw file(s) for %s %s; skipped!';
            disp(sprintf(msg,length(file_raw),inst,sn));
        end
    end
end
