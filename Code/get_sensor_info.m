function [sensor_type funcname ext status] = get_sensor_info(serial)

%% Instrument serial numbers

% SBE39
sbe39 = {'03253'};

% SBE56
sbe56 = {'00372','00392','00407','00422','00442','00445','00451'};

% RBR Solo

rbr_solo = {'100153','100154','100155','100156','100157','100158', '77561', ...
            '77562','77564','77565','77566','77567','77568','77569','77570', ...
            '100020','100021','100022','100024','100027','100028','100029','100031' ...
            '100159','100160','100161','100162'};


rbr_solo = cat(2,rbr_solo,{'077561','077562','077563','077564','077565','077566', ...
                    '077567','077568','077569','077570'});


% RBR Concerto
rbr_concerto = {'060280','060281','060094','060095'};

%% Make instrument map
instruments = containers.Map('keytype','char','valuetype','char');
for sn = sbe39, instruments(sn{:}) = 'SBE39'; end
for sn = sbe56, instruments(sn{:}) = 'SBE56'; end
for sn = rbr_solo, instruments(sn{:}) = 'RBR Solo'; end
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
    warning('Unknown instrument type for serial %s\n',serial)
end
