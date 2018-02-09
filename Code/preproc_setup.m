function config = preproc_setup(config);

disp('Identifying sensors and finding data...')
sensors = struct();
n = 0; % number of sensors successfully loaded
sensor_dir_func = ['sensor_dirs_' config.cruise];

for i = 1:length(config.sensor_sn)
    sn = config.sensor_sn{i};
    % Associate a parsing function and file extension with a serialnum}
    [sensor_type, parse_func, ext, status] = get_sensor_info(sn);

    if status==0 % found parsing func and file ext for serial

        % Check for a cruise-specific sensor directory function
        if exist(sensor_dir_func) == 2
            fpath = feval(sensor_dir_func,config,sn);
        else
            % Otherwise look in config.dir_raw
            fpath = config.dir_raw;
        end

        % Look for files that contain the serial number and have the 
        % correct file extension
        file_raw = dir(fullfile(fpath,['*' sn '*' ext]));
        if length(file_raw) == 1 % If exactly one file is found...
            n = n + 1; % increment sensor number
            fn_raw = file_raw.name;
            [~,fname,fext] = fileparts(fn_raw);
            fn_mat = [fname, '.mat'];
            sensors(n).sn = sn;
            sensors(n).file_raw = fullfile(fpath,fn_raw); % full path to raw data file
            sensors(n).file_mat = fullfile(fpath,fn_mat); % full path to .mat data file
            sensors(n).sensor_type = sensor_type;
            sensors(n).parse_func = parse_func;
            sensors(n).pos = config.sensor_pos(i);
            msg = '  %s [%s]';
            disp(sprintf(msg,sensor_type,sn));
        else % if the number of files found ~= 1
            msg = '%s [%s]: %d raw file(s), skipped!';
            disp(sprintf(msg,sensor_type,sn,length(file_raw)));
        end
    else
        disp(sprintf('  No sensor information found for [%s]',sn))
    end
end

config.sensors = sensors;
