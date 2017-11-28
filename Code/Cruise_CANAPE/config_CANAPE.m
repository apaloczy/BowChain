function config = config_CANAPE()
dir_base = fullfile(getenv('DATA'), 'OSU_Thermistors/');

i = 1;
config(i).name = 'T1';
config(i).dn_range = datenum([2016 09 04 0 0 0; 2017 09 25 0 0 0]);
config(i).sensor_sn = {'00280';'00281';'00285';'00291';'00292';'00295';'00296';'00299';'01548';'075998'};
config(i).drift = [44 17 14 30 15 28 31 29 3 43];

i = 2;
config(i).name = 'T2';
config(i).dn_range = datenum([2016 09 12 0 0 0; 2017 09 26 0 0 0]);
config(i).sensor_sn = {'00303';'00304';'00305';'00309';'00311';'00319';'00320';'00324';'00326';'00328'};
config(i).drift = [23 46 26 -33 -4 32 10 40 17 0];

i = 3;
config(i).name = 'T3';
config(i).dn_range = datenum([2016 09 08 0 0 0; 2017 09 28 0 0 0]);
config(i).sensor_sn = {'076309';'076310';'076311';'076312';'076313';'076314';'076315';'076316';'076317';'076318'};
config(i).drift = [-51 53 21 9 4 9 12 19 24 15];

i = 4;
config(i).name = 'T4';
config(i).dn_range = datenum([2016 09 26 0 0 0; 2017 09 23 0 0 0]);
config(i).sensor_sn = {'076583';'076584';'076585';'076586';'076587';'076588';'076589';'076590';'076591';'076592'};
config(i).drift = [31 -27 14 28 0 14 -6 25 14 1];

i = 5;
config(i).name = 'T5';
config(i).dn_range = datenum([2016 09 14 0 0 0; 2017 09 24 0 0 0]);
config(i).sensor_sn = {'00315';'00316';'00331';'00332';'076158';'076603';'076605';'076606';'076607';'076610'};
config(i).drift = [43 14 33 39 31 12 3 5 12 -6];

i = 6;
config(i).name = 'T6';
config(i).dn_range = datenum([2016 08 31 0 0 0; 2017 09 30 0 0 0]);
config(i).sensor_sn = {'076593';'076594';'076595';'076596';'076597';'076598';'076599';'076600';'076601';'076602'};
config(i).drift = [7 47 8 8 19 5 28 4 35 9];

tz = -8;
dn0 = datenum([2016 05 20 12 00 00]) - tz/24;
for i = 1:length(config)
    config(i).freq_base = 1/10;
    config(i).dir_raw = dir_base;
    config(i).sensor_pos = [180 200 225 250 280 325 375 430 490 570];
    config(i).time_offset_method = 'known_drift';
    config(i).time_synched = dn0;
end

