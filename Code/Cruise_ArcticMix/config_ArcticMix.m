function config = config_ArcticMix()
% Repository of bowchain configurations from the ArcticMix Cruise.

dir_base = user_directories('ArcticMix');
% dir_base = 'Arctic/ArcticMix/bowchain/';

% Deployment configurations
%% Test Deployment - set 7/26/2018 by MSA
i = 1;
% Deployment name and path
config(i).name = 'Test';
config(i).dir_raw = fullfile(dir_base,'20150903Rec');
% Deployment duration
config(i).dn_range = datenum(['01-Sep-2015 23:38';...
  '03-Sep-2015 05:30']);
% Sensor configuration
config(i).sensor_sn = {'00451';'100154';'060281';'00407';'100153';...
  '00445';'100157';'00422';'100159';'00442';'100155';'00372';'03134';...
  '100156'};
config(i).sensor_pos = [0 2 3 4 6 7 8 9 11 13 15 17 18 19];
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
% config(i).chain_model = 'cm_catenary';
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'onestep';
config(i).time_offset_interval = datenum(['03-Sep-2015 05:38';...
  '03-Sep-2015 05:48']);
% Pressure correction
config(i).zero_pressure_interval = datenum(['03-Sep-2015 05:36';...
  '03-Sep-2015 05:45']);
% Binning method
% config.freq_base = 1; % [Hz]
config(i).bin_method = 'time';
config(i).binned_period = 2;


%% Mackenzie Canyon
i = 2;
% Deployment name and path
config(i).name = 'MackCan';
config(i).dir_raw = fullfile(dir_base,'20150908Rec');
% Deployment duration
config(i).dn_range = datenum(['04-Sep-2015 06:45';...
  '07-Sep-2015 18:02']);
% Sensor configuration
config(i).sensor_sn = {'00451';'100161';'100154';'060281';'00407';...
  '100160';'100153';'00445';'100157';'00422';'100159';'100158';'00442';...
  '100162';'100155';'00392';'00372';'100156'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 9 11 12 13 14 15 16 17 19];
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'cohere';
config(i).cohere_interval = datenum(['04-Sep-2015 06:25';...
  '04-Sep-2015 06:35']);
% Pressure correction
% Binning method


%% Mooring to Moving Sea Ice Edge - set 7/26/2018 by MSA
i = 3;
% Deployment name and path
config(i).name = 'MooringToIce';
config(i).dir_raw = fullfile(dir_base,'20150911Rec');
% Deployment duration
config(i).dn_range = datenum(['09-Sep-2015 21:49:40';...
  '10-Sep-2015 08:36:14']);
% Sensor configuration
config(i).sensor_sn = {'00451';'100161';'100154';'060281';'00407';...
  '100160';'100153';'00445';'100157';'00422';'100159';'100158';'00442';...
  '100162';'03253';'100155';'00392';'00372';'060280';'100156'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 9 11 12 13 14 14.5 15 16 17 ...
  18 19];
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'known_offsets';
config(i).time_offsets = [0; 5.5; 4; -134.5; -2.5; 4; 4; -3.5; -2; ... 
  -7.5; -1.5; -2.5; -8; -4.5; -6; -5; -7.5; -7.5; -5.5; -5.5];
% Pressure correction
config(i).zero_pressure_interval = datenum(['09-Sep-2015 10:30';...
  '09-Sep-2015 14:30']);
% Binning method
config(i).bin_method = 'time';
config(i).binned_period = 2;


%% Repeated MMP Section 1 - set 7/26/2018 by MSA
i = 4;
% Deployment name and path
config(i).name = 'MMPrepeat1';
config(i).dir_raw = fullfile(dir_base,'20150911Rec');
% Deployment duration
config(i).dn_range = datenum(['10-Sep-2015 15:09:21';...
  '11-Sep-2015 18:11:05']);
% Sensor configuration
config(i).sensor_sn = {'00451';'100161';'100154';'060281';'00407';...
  '100160';'100153';'00445';'100157';'00422';'100159';'100158';'00442';...
  '100162';'03253';'100155';'00392';'00372';'060280';'100156'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 9 11 12 13 14 14.5 15 16 17 ...
  18 19];
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'known_offsets';
config(i).time_offsets = [0; 5.5; 4; -134.5; -2.5; 4; 4; -3.5; -2; ... 
  -7.5; -1.5; -2.5; -8; -4.5; -6; -5; -7.5; -7.5; -5.5; -5.5];
% Pressure correction
config(i).zero_pressure_interval = datenum(['09-Sep-2015 10:30';...
  '09-Sep-2015 14:30']);
% Binning method
config(i).bin_method = 'time';
config(i).binned_period = 2;


%% Repeated MMP Section 2 - set 7/26/2018 by MSA
i = 5;
% Deployment name and path
config(i).name = 'MMPrepeat2';
config(i).dir_raw = fullfile(dir_base,'20150914Rec');
% Deployment duration
config(i).dn_range = datenum(['14-Sep-2015 05:43:17';...
  '14-Sep-2015 20:28:27']);
% Sensor configuration
config(i).sensor_sn = {'00451';'100161';'100154';'060281';'00407';...
  '100160';'100153';'00445';'100157';'03134';'100159';'100158';'00442';...
  '100162';'03253';'100155';'00392';'00372';'060280';'100156'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 10 11 12 13 14 14.5 15 16 17 ...
  18 19];
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'known_offsets';
config(i).time_offsets = [0; 5.5; 4; -134.5; -2.5; 4; 4; -3.5; -2; ... 
  -7.5; -1.5; -2.5; -8; -4.5; -6; -5; -7.5; -7.5; -5.5; -5.5];
% Pressure correction
config(i).zero_pressure_interval = datenum(['14-Sep-2015 22:00';...
  '14-Sep-2015 23:30']);
% Binning method
config(i).bin_method = 'time';
config(i).binned_period = 2;


%% Small Boat During Coordinated Ice Edge Sampling
i = 6;
% Deployment name and path
config(i).name = 'SmallBoatCoord';
config(i).dir_raw = fullfile(dir_base,'20150916Rec');
% Deployment duration
config(i).dn_range = datenum(['15-Sep-2015 18:32:32';...
  '15-Sep-2015 23:51:38']);
% Sensor configuration
config(i).sensor_sn = {'00411';'100154';'012712';'100153';'00416';...
  '100162';'00418';'100155';'00421';'100159';'00448';'03253'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 9 10 11];
% GPS file and path
config(i).file_gps = [dir_base 'SmallBoat_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'cohere';
config(i).cohere_interval = config(i).dn_range;
% Pressure correction
% Binning method


%% Sikuliaq During Coordinate Ice Edge Sampling
i = 7;
% Deployment name and path
config(i).name = 'SikuliaqCoord';
config(i).dir_raw = fullfile(dir_base,'20150916Rec');
% Deployment duration
config(i).dn_range = datenum(['15-Sep-2015 22:12:57';...
  '16-Sep-2015 03:24:53']);
% Sensor configuration
config(i).sensor_sn = {'00453';'00451';'100161';'00406';'060281';...
  '00407';'100160';'00381';'00445';'100157';'00422';'00446';'00423';...
  '100158';'00442';'00455';'00449';'00392';'00372';'100156'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 20];
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'cohere';
config(i).cohere_interval = config(i).dn_range;
% Pressure correction
% Binning method


%% Warm Core Eddy Sections - set 8/2/2018 by MSA
i = 8;
% Deployment name and path
config(i).name = 'HotBlob';
config(i).dir_raw = fullfile(dir_base,'20150918Rec');
% Deployment duration
config(i).dn_range = datenum(['16-Sep-2015 18:59:02';...
  '17-Sep-2015 19:14:52']);
% Sensor configuration
config(i).sensor_sn = {'00453';'100154';'100161';'00406';'060281';...
  '00407';'100160';'100153';'00445';'100157';'012712';'100162';'00423';...
  '100158';'100155';'00449';'100159';'00372';'060280';'100156'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 15 16 17 18 19 20];
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'known_offsets';
config(i).time_offsets = [0; -0.5; -0.5; 0.5; -136.5; -1; -1; 3.5; 1; ...
  2; 2; 2.5; 1.5; 2; 1; 5; 5; 12.5; 9];
% Pressure correction
config(i).zero_pressure_interval = datenum(['17-Sep-2015 19:20';...
  '17-Sep-2015 19:30']);
% Binning method
% config.freq_base = 1; % [Hz]
config(i).bin_method = 'time';
config(i).binned_period = 2;


%% Bering Strait Section 1 - set 8/2/2018 by MSA
i = 9;
% Deployment name and path
config(i).name = 'BeringStrait1';
config(i).dir_raw = fullfile(dir_base,'20150925Rec');
% Deployment duration
config(i).dn_range = datenum(['23-Sep-2015 23:42:00';...
  '24-Sep-2015 06:43:00']);
% Sensor configuration
config(i).sensor_sn = {'00453';'100154';'100161';'00406';'060281';...
  '00407';'100160';'100153';'00445';'100157';'012712';'100162';'00423';...
  '100158';'00442';'100155';'00449';'100159';'00372';'060280';'100156'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 ...
  19 20];
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'known_offsets';
config(i).time_offsets = [0; -0.5; -0.5; 0.5; -136.5; -1; -1; 3.5; 1; ...
  2; 2; 2.5; 1.5; 1.5; 2; 1; 5; 5; 12.5; 9];
% Pressure correction
config(i).zero_pressure_interval = datenum(['25-Sep-2015 10:50';...
  '25-Sep-2015 11:20']);
% Binning method
% config.freq_base = 1; % [Hz]
config(i).bin_method = 'time';
config(i).binned_period = 2;


%% Bering Strait Section 2 - set 8/2/2018 by MSA
i = 10;
% Deployment name and path
config(i).name = 'BeringStrait2';
config(i).dir_raw = fullfile(dir_base,'20150925Rec');
% Deployment duration
config(i).dn_range = datenum(['24-Sep-2015 15:01:00';...
  '25-Sep-2015 10:37:00']);
% Sensor configuration
config(i).sensor_sn = {'00453';'100154';'100161';'00406';'060281';...
  '00407';'100160';'100153';'00445';'100157';'012712';'100162';'00423';...
  '100158';'00442';'100155';'00449';'100159';'00372';'060280';'100156'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 ...
  19 20];
% GPS file and path
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% Chain model
config(i).chain_model = 'cm_straight';
% Time offset
config(i).time_offset_method = 'known_offsets';
config(i).time_offsets = [0; -0.5; -0.5; 0.5; -136.5; -1; -1; 3.5; 1; ...
  2; 2; 2.5; 1.5; 1.5; 2; 1; 5; 5; 12.5; 9];
% Pressure correction
config(i).zero_pressure_interval = datenum(['25-Sep-2015 10:50';...
  '25-Sep-2015 11:20']);
% Binning method
% config.freq_base = 1; % [Hz]
config(i).bin_method = 'time';
config(i).binned_period = 2;


% force re-parsing of raw data
% config = fill_defaults(config,struct('raw2mat',true));
