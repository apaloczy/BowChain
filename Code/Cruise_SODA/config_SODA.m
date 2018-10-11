function config = config_SODA()
% Repository of bowchain configurations from the ArcticMix Cruise.

dir_base = user_directories('SODA');

% Deployment configurations
%% Deployment 1 - set 10/11/2018 by MSA
i = 1;
% Deployment name and path
config(i).name = 'deployment1';
config(i).dir_raw = fullfile(dir_base,'deployment1');
% Deployment duration
config(i).dn_range = datenum(['01-Sep-2018 23:38';...
  '26-Sep-2018 05:30']);
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
config(i).time_offset_interval = datenum(['01-Sep-2018 05:38';...
  '03-Sep-2015 05:48']);
% Pressure correction
config(i).zero_pressure_interval = datenum(['28-Sep-2018 05:36';...
  '03-Sep-2015 05:45']);
% Binning method
% config.freq_base = 1; % [Hz]
config(i).bin_method = 'time';
config(i).binned_period = 1;
config(i).bin_zgrid = -1*(1:20)';