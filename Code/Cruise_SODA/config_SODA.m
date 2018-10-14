function config = config_SODA()
% Repository of bowchain configurations from the ArcticMix Cruise.

dir_base = user_directories('SODA');

% Deployment configurations
%% Deployment 1.1 - set 10/13/2018 by MSA
i = 1;
% Deployment name and path
config(i).name = 'deployment1_1';
config(i).dir_raw = fullfile(dir_base,'deployment1');
% Deployment duration
config(i).dn_range = datenum(['08-Sep-2018 06:28';...
  '08-Sep-2018 20:52']);
% Sensor configuration
config(i).sensor_sn = {'100885';'077562';'060558';'100694';'100153';...
  '100886';'100702';'100699';'100700';'101159';'100695';'100696';...
  '100698';'101188';'100701';'060281';'101162';'101161';'077570'};
config(i).sensor_pos = 0:18;
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'onestep';
config(i).time_offset_interval = datenum(['09-Sep-2018 00:00';...
  '09-Sep-2018 00:03']);
% Pressure correction
config(i).zero_pressure_interval = datenum(['08-Sep-2018 21:00';...
  '08-Sep-2018 23:00']);
% Binning method
config(i).bin_method = 'time';
config(i).binned_period = 1;
config(i).bin_zgrid = -1*(3:21)';
% Save config and ungridded data
config(i).include_config = 1;
config(i).include_ungridded = 1;


%% Deployment 1.2 - set 10/13/2018 by MSA
i = 2;
% Deployment name and path
config(i).name = 'deployment1_2';
config(i).dir_raw = fullfile(dir_base,'deployment1');
% Deployment duration
config(i).dn_range = datenum(['09-Sep-2018 00:12';...
  '09-Sep-2018 20:25']);
% Sensor configuration
config(i).sensor_sn = {'100885';'077562';'060558';'100694';'100153';...
  '100886';'100702';'100699';'100700';'066064';'100695';'100696';...
  '100698';'101188';'100701';'060281';'101162';'101161';'077570'};
config(i).sensor_pos = 0:18;
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'onestep';
config(i).time_offset_interval = datenum(['09-Sep-2018 00:00';...
  '09-Sep-2018 00:03']);
% Pressure correction
config(i).zero_pressure_interval = datenum(['09-Sep-2018 21:00';...
  '09-Sep-2018 23:00']);
% Binning method
config(i).bin_method = 'time';
config(i).binned_period = 1;
config(i).bin_zgrid = -1*(3:21)';
% Save config and ungridded data
config(i).include_config = 1;
config(i).include_ungridded = 1;


%% Deployment 2 - set 10/13/2018 by MSA
i = 3;
% Deployment name and path
config(i).name = 'deployment2';
config(i).dir_raw = fullfile(dir_base,'deployment2');
% Deployment duration
config(i).dn_range = datenum(['13-Sep-2018 18:02';...
  '14-Sep-2018 00:27']);
% Sensor configuration
config(i).sensor_sn = {'100885';'077562';'060558';'100694';'100153';...
  '100886';'100702';'100699';'100700';'060559';'100695';'100696';...
  '100698';'101188';'100701';'060281';'101162';'101161';'077570'};
config(i).sensor_pos = 0:18;
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'onestep';
config(i).time_offset_interval = datenum(['13-Sep-2018 17:30';...
  '13-Sep-2018 18:00']);
% Pressure correction
config(i).zero_pressure_interval = datenum(['14-Sep-2018 01:00';...
  '14-Sep-2018 03:00']);
% Binning method
config(i).bin_method = 'time';
config(i).binned_period = 1;
config(i).bin_zgrid = -1*(3:20)';
% Save config and ungridded data
config(i).include_config = 1;
config(i).include_ungridded = 1;


%% Deployment 3 - set 10/13/2018 by MSA
i = 4;
% Deployment name and path
config(i).name = 'deployment3';
config(i).dir_raw = fullfile(dir_base,'deployment3');
% Deployment duration
config(i).dn_range = datenum(['15-Sep-2018 04:40';...
  '15-Sep-2018 06:40']);
% Sensor configuration
config(i).sensor_sn = {'100885';'077562';'060558';'100694';'100153';...
  '100886';'100702';'100699';'100700';'060559';'100695';'100696';...
  '100698';'101188';'100701';'060281';'101162';'101161';'077570'};
config(i).sensor_pos = 0:18;
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'onestep';
config(i).time_offset_interval = datenum(['15-Sep-2018 04:10';...
  '15-Sep-2018 04:30']);
% Pressure correction
config(i).zero_pressure_interval = datenum(['15-Sep-2018 07:00';...
  '15-Sep-2018 10:00']);
% Binning method
config(i).bin_method = 'time';
config(i).binned_period = 1;
config(i).bin_zgrid = -1*(3:21)';
% Save config and ungridded data
config(i).include_config = 1;
config(i).include_ungridded = 1;


%% Deployment 4 - set 10/13/2018 by MSA
i = 5;
% Deployment name and path
config(i).name = 'deployment4';
config(i).dir_raw = fullfile(dir_base,'deployment4');
% Deployment duration
config(i).dn_range = datenum(['20-Sep-2018 17:01';...
  '21-Sep-2018 00:41']);
% Sensor configuration
config(i).sensor_sn = {'100885';'077562';'060183';'100694';'100153';...
  '100886';'100702';'100699';'100700';'060559';'100695';'100696';...
  '100698';'101188';'100701';'060281';'101162';'101161';'077570'};
config(i).sensor_pos = 0:18;
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'known_offsets';
config(i).time_offsets = [0; 1; 0; 1; 1; 0.5; 0.5; 1.5; 1.5; 1.5; 1.5;...
  1.5; 1; 1.5; 1.5; 1; 2; 0.5; 2]; % From dunk test!
% Pressure correction
config(i).zero_pressure_interval = datenum(['21-Sep-2018 01:30';...
  '21-Sep-2018 03:30']);
% Binning method
config(i).bin_method = 'time';
config(i).binned_period = 1;
config(i).bin_zgrid = -1*(4:22)';
% Save config and ungridded data
config(i).include_config = 1;
config(i).include_ungridded = 1;


%% Deployment 5 - set 10/13/2018 by MSA
i = 6;
% Deployment name and path
config(i).name = 'deployment5';
config(i).dir_raw = fullfile(dir_base,'deployment5');
% Deployment duration
config(i).dn_range = datenum(['21-Sep-2018 05:42';...
  '21-Sep-2018 06:39']);
% Sensor configuration
config(i).sensor_sn = {'100885';'077562';'060183';'100694';'100153';...
  '100886';'100702';'100699';'100700';'060559';'100695';'100696';...
  '100698';'101188';'100701';'060281';'101162';'101161';'077570'};
config(i).sensor_pos = 0:18;
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'known_offsets';
config(i).time_offsets = [0; 1; 0; 1; 1; 0.5; 0.5; 1.5; 1.5; 1.5; 1.5;...
  1.5; 1; 1.5; 1.5; 1; 2; 0.5; 2]; % From dunk test!
% Pressure correction
config(i).zero_pressure_interval = datenum(['21-Sep-2018 07:00';...
  '21-Sep-2018 09:00']);
% Binning method
config(i).bin_method = 'time';
config(i).binned_period = 1;
config(i).bin_zgrid = -1*(4:20)';
% Save config and ungridded data
config(i).include_config = 1;
config(i).include_ungridded = 1;


%% Deployment 6.1 - set 10/13/2018 by MSA
i = 7;
% Deployment name and path
config(i).name = 'deployment6_1';
config(i).dir_raw = fullfile(dir_base,'deployment6');
% Deployment duration
config(i).dn_range = datenum(['21-Sep-2018 23:22';...
  '22-Sep-2018 05:38']);
% Sensor configuration
config(i).sensor_sn = {'100885';'077562';'060183';'100694';'100153';...
  '100886';'100702';'100699';'100700';'060559';'100695';'100696';...
  '100698';'101188';'100701';'060281';'101162';'101161';'077570'};
config(i).sensor_pos = 0:18;
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'known_offsets';
config(i).time_offsets = [0; 1; 0; 1; 1; 0.5; 0.5; 1.5; 1.5; 1.5; 1.5;...
  1.5; 1; 1.5; 1.5; 1; 2; 0.5; 2]; % From dunk test!
% Pressure correction
config(i).zero_pressure_interval = datenum(['21-Sep-2018 18:00';...
  '21-Sep-2018 21:00']);
% Binning method
config(i).bin_method = 'time';
config(i).binned_period = 1;
config(i).bin_zgrid = -1*(3:21)';
% Save config and ungridded data
config(i).include_config = 1;
config(i).include_ungridded = 1;


%% Deployment 6.2 - set 10/13/2018 by MSA
i = 8;
% Deployment name and path
config(i).name = 'deployment6_2';
config(i).dir_raw = fullfile(dir_base,'deployment6');
% Deployment duration
config(i).dn_range = datenum(['22-Sep-2018 11:27';...
  '22-Sep-2018 12:33']);
% Sensor configuration
config(i).sensor_sn = {'100885';'077562';'060183';'100694';'100153';...
  '100886';'100702';'100699';'100700';'060559';'100695';'100696';...
  '100698';'101188';'100701';'060281';'101162';'101161';'077570'};
config(i).sensor_pos = 0:18;
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'onestep';
config(i).time_offset_interval = datenum(['22-Sep-2018 16:37';...
  '22-Sep-2018 16:39']); % Dunk test!
% Pressure correction
config(i).zero_pressure_interval = datenum(['22-Sep-2018 09:30';...
  '22-Sep-2018 11:00']);
% Binning method
config(i).bin_method = 'time';
config(i).binned_period = 1;
config(i).bin_zgrid = -1*(4:22)';
% Save config and ungridded data
config(i).include_config = 1;
config(i).include_ungridded = 1;


%% Deployment 7.1 - set 10/13/2018 by MSA
i = 9;
% Deployment name and path
config(i).name = 'deployment7_1';
config(i).dir_raw = fullfile(dir_base,'deployment7');
% Deployment duration
config(i).dn_range = datenum(['25-Sep-2018 23:59';...
  '26-Sep-2018 15:10']);
% Sensor configuration
config(i).sensor_sn = {'100885';'077562';'060183';'100694';'100153';...
  '060558';'100702';'100699';'100700';'060559';'100695';'100696';...
  '100698';'101188';'100701';'060281';'101162';'101161';'077570'};
config(i).sensor_pos = 0:18;
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'onestep';
config(i).time_offset_interval = datenum(['25-Sep-2018 23:45';...
  '25-Sep-2018 23:55']);
% Pressure correction
config(i).zero_pressure_interval = datenum(['27-Sep-2018 20:00';...
  '27-Sep-2018 21:45']);
% Binning method
config(i).bin_method = 'time';
config(i).binned_period = 1;
config(i).bin_zgrid = -1*(4:20)';
% Save config and ungridded data
config(i).include_config = 1;
config(i).include_ungridded = 1;


%% Deployment 7.2 - set 10/13/2018 by MSA
i = 10;
% Deployment name and path
config(i).name = 'deployment7_2';
config(i).dir_raw = fullfile(dir_base,'deployment7');
% Deployment duration
config(i).dn_range = datenum(['26-Sep-2018 21:20';...
  '27-Sep-2018 19:12']);
% Sensor configuration
config(i).sensor_sn = {'100885';'077562';'060183';'100694';'100153';...
  '060558';'100702';'100699';'100700';'060559';'100695';'100696';...
  '100698';'101188';'100701';'060281';'101162';'101161';'077570'};
config(i).sensor_pos = 0:18;
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'onestep';
config(i).time_offset_interval = datenum(['25-Sep-2018 23:45';...
  '25-Sep-2018 23:55']);
% Pressure correction
config(i).zero_pressure_interval = datenum(['27-Sep-2018 20:00';...
  '27-Sep-2018 21:45']);
% Binning method
config(i).bin_method = 'time';
config(i).binned_period = 1;
config(i).bin_zgrid = -1*(3:21)';
% Save config and ungridded data
config(i).include_config = 1;
config(i).include_ungridded = 1;