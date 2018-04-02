function config = preproc_setup(config);

disp('Identifying sensors and finding data...')
conig.sensors = struct();
pos_ind = 0; % position index

sensor_dir_func = ['sensor_dirs_' config.cruise];

for i = 1:length(config.sensor_sn)
    sn = config.sensor_sn{i};
    % Associate a parsing function and file extension with a serialnum}
    [sensor_type, parse_func, ext, status] = get_sensor_info(sn);
    if status==0 % found parsing func and file ext for serial
        if exist(sensor_dir_func,'file')
            fpath = feval(sensor_dir_func,config,sn);
        else
            fpath = config.dir_raw;
        end
        file_raw = dir(fullfile(fpath,['*' sn '*' ext]));
        if length(file_raw) == 1
            pos_ind = pos_ind + 1;
            fn_raw = file_raw.name;
            [~,fname,fext] = fileparts(fn_raw);
            fn_mat = [fname, '.mat'];
            config.sensors(pos_ind) = struct(...
                'sn'          , sn                     ,...
                'file_raw'    , fullfile(fpath,fn_raw) ,...
                'file_mat'    , fullfile(fpath,fn_mat) ,...
                'sensor_type' , sensor_type            ,...
                'parse_func'  , parse_func             ,...
                'pos'         , config.sensor_pos(i)   ,...
                'pos_ind'     , pos_ind);
            msg = '  %s [%s]';
            disp(sprintf(msg,sensor_type,sn));
        else
            msg = '  %s [%s]: %d raw file(s), skipped!';
            disp(sprintf(msg,sensor_type,sn,length(file_raw)));
        end
    else
        disp(sprintf('  No sensor information found for [%s]',sn))
    end
end
