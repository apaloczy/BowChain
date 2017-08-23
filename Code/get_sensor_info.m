function [sensor_type funcname ext status] = get_sensor_info(serial)

%% Instrument map
instruments = containers.Map('keytype','char','valuetype','char');

% SBE39
sbe39 = {'03253'};
for sn = sbe39, instruments(sn{:}) = 'SBE39'; end

% SBE56
sbe56 = {'00372','00392','00407','00422','00442','00445','00451'};
for sn = sbe56, instruments(sn{:}) = 'SBE56'; end

% RBR Solo
rbr_solo = {'100153','100154','100155','100156','100157','100158',...
            '100159','100160','100161','100162'};
for sn = rbr_solo, instruments(sn{:}) = 'RBR Solo'; end

% RBR Concerto
rbr_concerto = {'060280','060281'};
for sn = rbr_concerto, instruments(sn{:}) = 'RBR Concerto'; end

%% Parse function map
parsefuncs = containers.Map('keytype','char','valuetype','char');
parsefuncs('SBE39')        = 'parse_sbe39';
parsefuncs('SBE56')        = 'parse_sbe56';
parsefuncs('RBR Solo')     = 'parse_rbr_solo';
parsefuncs('RBR Concerto') = 'parse_rbr_concerto';

%% File extension map
exts = containers.Map('keytype','char','valuetype','char');
exts('SBE39')        = '.asc';
exts('SBE56')        = '.cnv';
exts('RBR Solo')     = '.rsk';
exts('RBR Concerto') = '.rsk';

%% Return parsing function and file extension
if isKey(instruments,serial)
    sensor_type = instruments(serial);
    funcname = parsefuncs(sensor_type);
    ext = exts(sensor_type);
    status = 0;
else
    sensor_type = '';
    funcname = '';
    ext = '';
    status = 1;
    warning('Unknown instrument type for serial %d',serial)
end
