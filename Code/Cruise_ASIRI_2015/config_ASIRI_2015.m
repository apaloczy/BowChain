function config = config_ASIRI_2015()

%% Cruise-wide options
dir_raw = fullfile(getenv('DROPBOX'), 'ASIRI-bowchain/raw/');

%% Deployment setup
config(1).name = 'Deploy01';
config(1).dn_range = datenum([2015 8 24 04 30 00;
                              2015 8 24 05 30 00]);
config(1).dir_raw = fullfile(dir_raw, 'Deploy01/raw/');
config(1).sensor_sn = {'060094';
                    '060095';
                    '077561';
                    '077562';
                    '077563';
                    '077564';
                    '077565';
                    '077566';
                    '077567';
                    '077568';
                    '077569';
                    '077570';
                    '100020';
                    '100021';
                    '100022';
                    '100024';
                    '100027';
                    '100028';
                    '100029';
                    '100031'};
config(1).sensor_pos = 1:length(config(1).sensor_sn); % PLACEHOLDER! definitley not accurate positions

return

%% The below deployments are not fully configured


config(2).name = 'Deploy02';
config(2).dir_raw = fullfile(dir_raw, 'Deploy02/raw/');


config(3).name = 'Deploy03';
config(3).dir_raw = fullfile(dir_raw, 'Deploy03/raw/');


config(4).name = 'Deploy04';
config(4).dir_raw = fullfile(dir_raw, 'Deploy04/raw/');


config(5).name = 'Deploy05';
config(5).dir_raw = fullfile(dir_raw, 'Deploy05/raw/');


config(6).name = 'Deploy06';
config(6).dir_raw = fullfile(dir_raw, 'Deploy06/');


config(7).name = 'Deploy07';
config(7).dir_raw = fullfile(dir_raw, 'Deploy07/');


config(8).name = 'Deploy08';
config(8).dir_raw = fullfile(dir_raw, 'Deploy08/');


config(9).name = 'Deploy09';
config(9).dir_raw = fullfile(dir_raw, 'Deploy09/');


config(10).name = 'Deploy10';
config(10).dir_raw = fullfile(dir_raw, 'Deploy10/');



% For testing purposes, make some (fake) defaults so that get_config doesn't
% complain about missing options.
% defaults.dn_range = [-inf inf];
% defaults.sensor_sn = {'1234'};
% defaults.sensor_pos = [0];

% config = fill_defaults(config,defaults);


