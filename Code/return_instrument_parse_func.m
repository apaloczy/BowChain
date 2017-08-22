function funcname = return_instrument_parse_func(serial)

%% Instrument map
instruments = containers.Map('keytype','double','valuetype','char');

% SBE56
sbe56 = [372, 392, 407, 422, 442, 445, 451];
for sn = sbe56, instruments(sn) = 'SBE56'; end

% RBR Solo
rbr_solo = [100155, 100156, 100158, 100160, 100161, 100162];
for sn = rbr_solo, instruments(sn) = 'RBR Solo'; end

% RBR Concerto
rbr_concerto = [60280, 60281];
for sn = rbr_concerto, instruments(sn) = 'RBR Concerto'; end


%% Parse function map
parsefuncs = containers.Map('keytype','char','valuetype','char');
parsefuncs('SBE56') = 'parse_sbe56';
parsefuncs('RBR Solo') = 'parse_rbr_solo';
parsefuncs('RBR Concerto') = 'parse_rbr_concerto';

%% Return parsing function corresponding to input serial number
funcname = parsefuncs(instruments(serial));

