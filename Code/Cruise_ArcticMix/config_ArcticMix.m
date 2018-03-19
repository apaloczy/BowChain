function config = config_ArcticMix()
% Repository of bowchain configurations from the ArcticMix Cruise.

dir_base = user_directories('ArcticMix');
% dir_base = 'Arctic/ArcticMix/bowchain/';

%% Deployment configuration

% Test Deployment
i = 1;
config(i).name = 'Test';
config(i).dir_raw = fullfile(dir_base,'20150903Rec');
config(i).dn_range = datenum(['01-Sep-2015 23:38';...
  '03-Sep-2015 05:30']);
config(i).sensor_sn = {'00451';'100154';'060281';'00407';'100153';...
  '00445';'100157';'00422';'100159';'00442';'100155';'00372';'03134';...
  '100156'};
config(i).sensor_pos = [0 2 3 4 6 7 8 9 11 13 15 17 18 19];
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
% config(i).chain_model = 'cm_catenary';
config(i).chain_model = 'cm_straight';
config(i).time_offset_method = 'cohere';
% config(i).cohere_interval = config(i).dn_range;
config(i).cohere_interval = datenum(['01-Sep-2015 23:08:00';...
  '03-Sep-2015 05:45:25']);
% config(i).cohere_interval = datenum(['01-Sep-2015 23:08';...
%   '01-Sep-2015 23:15']);
% config(i).cohere_interval = datenum(['03-Sep-2015 05:39:00';...
%   '03-Sep-2015 05:45:25']);
config(i).zero_pressure_interval = datenum(['03-Sep-2015 05:36';...
  '03-Sep-2015 05:45']);
% config.freq_base = 1; % [Hz]
config(i).bin_method = 'time';
config(i).binned_period = 30;

% Mackenzie Canyon
i = 2;
config(i).name = 'MackCan';
config(i).dir_raw = fullfile(dir_base,'20150908Rec');
config(i).dn_range = datenum(['04-Sep-2015 06:45';...
  '07-Sep-2015 18:02']);
config(i).sensor_sn = {'00451';'100161';'100154';'060281';'00407';...
  '100160';'100153';'00445';'100157';'00422';'100159';'100158';'00442';...
  '100162';'100155';'00392';'00372';'100156'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 9 11 12 13 14 15 16 17 19];
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
config(i).chain_model = 'cm_straight';
config(i).time_offset_method = 'cohere';
config(i).cohere_interval = datenum(['04-Sep-2015 06:25';...
  '04-Sep-2015 06:35']);


% Mooring to Moving Sea Ice Edge
i = 3;
config(i).name = 'MooringToIce';
config(i).dir_raw = fullfile(dir_base,'20150911Rec');
config(i).dn_range = datenum(['09-Sep-2015 21:49:40';...
  '10-Sep-2015 08:36:14']);
config(i).sensor_sn = {'00451';'100161';'100154';'060281';'00407';...
  '100160';'100153';'00445';'100157';'00422';'100159';'100158';'00442';...
  '100162';'03253';'100155';'00392';'00372';'060280';'100156'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 9 11 12 13 14 14.5 15 16 17 ...
  18 19];
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
config(i).chain_model = 'cm_straight';
config(i).time_offset_method = 'cohere';
config(i).cohere_interval = datenum(['09-Sep-2015 20:30';...
  '09-Sep-2015 22:30']);
config(i).zero_pressure_interval = datenum(['09-Sep-2015 10:30';...
  '09-Sep-2015 14:30']);


% Repeated MMP Section 1
i = 4;
config(i).name = 'MMPrepeat1';
config(i).dir_raw = fullfile(dir_base,'20150911Rec');
config(i).dn_range = datenum(['10-Sep-2015 15:09:21';...
  '11-Sep-2015 18:11:05']);
config(i).sensor_sn = {'00451';'100161';'100154';'060281';'00407';...
  '100160';'100153';'00445';'100157';'00422';'100159';'100158';'00442';...
  '100162';'03253';'100155';'00392';'00372';'060280';'100156'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 9 11 12 13 14 14.5 15 16 17 ...
  18 19];
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
config(i).chain_model = 'cm_straight';
config(i).time_offset_method = 'cohere';
config(i).cohere_interval = datenum(['09-Sep-2015 20:30';...
  '09-Sep-2015 22:30']);
config(i).zero_pressure_interval = datenum(['09-Sep-2015 10:30';...
  '09-Sep-2015 14:30']);

% Repeated MMP Section 2
i = 5;
config(i).name = 'MMPrepeat2';
config(i).dir_raw = fullfile(dir_base,'20150914Rec');
config(i).dn_range = datenum(['14-Sep-2015 05:43:17';...
  '14-Sep-2015 20:28:27']);
config(i).sensor_sn = {'00451';'100161';'100154';'060281';'00407';...
  '100160';'100153';'00445';'100157';'03134';'100159';'100158';'00442';...
  '100162';'03253';'100155';'00392';'00372';'060280';'100156'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 10 11 12 13 14 14.5 15 16 17 ...
  18 19];
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
config(i).chain_model = 'cm_straight';
config(i).time_offset_method = 'cohere';
config(i).cohere_interval = config(i).dn_range;


% Small Boat During Coordinated Ice Edge Sampling
i = 6;
config(i).name = 'SmallBoatCoord';
config(i).dir_raw = fullfile(dir_base,'20150916Rec');
config(i).dn_range = datenum(['15-Sep-2015 18:32:32';...
  '15-Sep-2015 23:51:38']);
config(i).sensor_sn = {'00411';'100154';'012712';'100153';'00416';...
  '100162';'00418';'100155';'00421';'100159';'00448';'03253'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 9 10 11];
config(i).file_gps = [dir_base 'SmallBoat_gps.mat'];
config(i).chain_model = 'cm_straight';
config(i).time_offset_method = 'cohere';
config(i).cohere_interval = config(i).dn_range;


% Sikuliaq During Coordinate Ice Edge Sampling
i = 7;
config(i).name = 'SikuliaqCoord';
config(i).dir_raw = fullfile(dir_base,'20150916Rec');
config(i).dn_range = datenum(['15-Sep-2015 22:12:57';...
  '16-Sep-2015 03:24:53']);
config(i).sensor_sn = {'00453';'00451';'100161';'00406';'060281';...
  '00407';'100160';'00381';'00445';'100157';'00422';'00446';'00423';...
  '100158';'00442';'00455';'00449';'00392';'00372';'100156'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 20];
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
config(i).chain_model = 'cm_straight';
config(i).time_offset_method = 'cohere';
config(i).cohere_interval = config(i).dn_range;


% Warm Core Eddy Sections
i = 8;
config(i).name = 'HotBlob';
config(i).dir_raw = fullfile(dir_base,'20150918Rec');
config(i).dn_range = datenum(['16-Sep-2015 18:59:02';...
  '17-Sep-2015 19:14:52']);
config(i).sensor_sn = {'00453';'100154';'100161';'00406';'060281';...
  '00407';'100160';'100153';'00445';'100157';'012712';'100162';'00423';...
  '100158';'100155';'00449';'100159';'00372';'060280';'100156'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 15 16 17 18 19 20];
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
config(i).chain_model = 'cm_straight';
config(i).time_offset_method = 'cohere';
config(i).cohere_interval = config(i).dn_range;


% Bering Strait Sections
i = 9;
config(i).name = 'BeringStrait';
config(i).dir_raw = fullfile(dir_base,'20150925Rec');
config(i).dn_range = datenum(['23-Sep-2015 23:42:00';...
  '25-Sep-2015 10:37:00']);
config(i).sensor_sn = {'00453';'100154';'100161';'00406';'060281';...
  '00407';'100160';'100153';'00445';'100157';'012712';'100162';'00423';...
  '100158';'00442';'100155';'00449';'100159';'00372';'060280';'100156'};
config(i).sensor_pos = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 ...
  19 20];
config(i).file_gps = [dir_base 'Sikuliaq_gps.mat'];
config(i).chain_model = 'cm_straight';
config(i).time_offset_method = 'cohere';
config(i).cohere_interval = config(i).dn_range;

% force re-parsing of raw data
% config = fill_defaults(config,struct('raw2mat',true));
