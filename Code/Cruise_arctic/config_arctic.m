%% Cruise-wide options
config.dir_raw = '~/OSU/BowChain/Sources/Arctic_bowchain/RawData/';

%% Deployment-specific options
switch dep
  case 'MooringToIce'
    config.dir_deployment = '11sept_1900_recovery';
    config.dn_range = datenum([...
        '09-Sep-2015 21:49:40';
        '10-Sep-2015 08:36:14']);
    config.sensor_sn ={'00451';'100161';'100154';'060281';'00407';'100160';...
                       '100153';'00445';'100157';'00422';'100159';'100158';'00442';...
                       '100162';'03253';'100155';'00392';'00372';'060280';'100156'};
    config.sensor_pos = [0 1 2 3 4 5 6 7 8 9 11 12 13 14 14.5 15 16 17 18 19];
end