function config = config_OC1710A()

dir_base = user_directories('OC1710A')

ndeps = 4;
config = struct();

dn_range = {datenum(['09-Oct-2017 01:20:13';
                     '09-Oct-2017 15:58:22']);
            datenum(['10-Oct-2017 15:37:20';
                     '11-Oct-2017 13:29:01']);
            datenum(['11-Oct-2017 15:23:32';
                     '12-Oct-2017 12:55:38']);
            datenum(['14-Oct-2017 16:05:01';
                     '15-Oct-2017 00:14:31'])};

%% Set up directories and processing options
for i = 1:ndeps
    config(i).name = sprintf('deployment_%d',i);
    config(i).dir_raw = fullfile(dir_base,config(i).name);
    config(i).dn_range = dn_range{i};
    % config(i).file_gps = [];
    config(i).chain_model = 'cm_straight';
    % config(i).time_offset_method = 'cohere';
    % config(i).cohere_interval = config(i).dn_range;
    % config(i).zero_pressure_interval = [];
    % config(i).bin_method = 'time';
    % config(i).binned_period = 10;

    % all spreadsheets showed the same instrument positions
    config(i).sensor_pos = 1:19; % sensor position (m)
    config(i).sensor_sn = {
        '100701','101188','100699','101168', ...
        '100696','100157','100695','101162','100693', ...
        'G049','100694','101161','101158','100154', ...
        '060281','101159','100153','G050','100162'
                   };
end
