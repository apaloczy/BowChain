function config = config_ArcticMix()

dir_base = [getenv('HOME') '/OSU/BowChain/Sources/Arctic_bowchain/RawData/'];

%% Deployment configuration
config(1).name = 'MooringToIce';
config(1).dir_raw = fullfile(dir_base,'11sept_1900_recovery');
% config(1).dn_range = datenum([...
%     '09-Sep-2015 21:49:40';
%     '10-Sep-2015 08:36:14']);
config(1).dn_range = datenum([...
    '09-Sep-2015 21:49:40';
    '09-Sep-2015 22:49:40']);
config(1).time_offset_method = 'cohere';
config(1).cohere_interval = config(1).dn_range;
config(1).sensor_sn ={'00451';'100161';'100154';'060281';'00407';'100160';...
                      '100153';'00445';'100157';'00422';'100159';'100158';'00442';...
                      '100162';'03253';'100155';'00392';'00372';'060280';'100156'};
config(1).sensor_pos = [0 1 2 3 4 5 6 7 8 9 11 12 13 14 14.5 15 16 17 18 19];
config(1).chain_model = 'cm_straight';

config(2) = config(1);
config(2).chain_model = 'cm_catenary';

