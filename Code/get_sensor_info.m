function [sensor_type funcname ext status] = get_sensor_info(serial)

%% Instrument serial numbers

% SBE39
sbe39 = {'03253','03134'};

% SBE56
sbe56 = {'00280','00281','00285','00291','00292','00295','00296','00299', ...
         '00303','00304','00305','00309','00311','00315','00316','00319', ...
         '00320','00324','00326','00328','00331','00332','00372','00381', ...
         '00392','00406','00407','00411','00416','00418','00421','00422', ...
         '00423','00442','00445','00446','00448','00449','00451','00453', ...
         '00455','01548'};

% RBR Solo
rbr_solo = {'075998','076158','076309','076310','076311','076312','076313', ...
            '076314','076315','076316','076317','076318','076583','076584', ...
            '076585','076586','076587','076588','076589','076590','076591', ...
            '076592','076593','076594','076595','076596','076597','076598', ...
            '076599','076600','076601','076602','076603','076605','076606', ...
            '076607','076610','077416','077561','077561','077561','077561', ...
            '077562','077562','077562','077562','077563','077563','077564', ...
            '077564','077564','077564','077565','077565','077565','077566', ...
            '077566','077566','077567','077567','077567','077568','077568', ...
            '077568','077568','077569','077569','077569','077569','077570', ...
            '077570','077570','100020','100021','100022','100024','100027', ...
            '100028','100029','100031','100153','100154','100155','100156', ...
            '100157','100158','100159','100160','100161','100162','100693', ...
            '100694','100695','100698','100699','100700','100701','100702', ...
            '101168','101188'};

% RBR Concerto
rbr_concerto = {'060280','060281','060094','060095','060559'};

% Duet
rbr_duet = {'082489','082506'};

% GusT
gust = {'G049','G050'};

status = 0;
switch serial
  case sbe39
    sensor_type = 'SBE39';
    funcname = 'parse_sbe39';
    ext = '.asc';
  case sbe56
    sensor_type = 'SBE56';
    funcname = 'parse_sbe56';
    ext = '.cnv';
  case rbr_solo
    sensor_type = 'RBR Solo';
    funcname = 'parse_rbr_solo';
    ext = '.rsk';
  case rbr_duet
    sensor_type = 'RBR Duet';
    funcname = 'parse_rbr_duet';
    ext = '.rsk';
  case rbr_concerto
    sensor_type = 'RBR Concerto';
    funcname = 'parse_rbr_concerto';
    ext = '.rsk';
  case gust
    sensor_type = 'GusT';
    funcname = 'parse_GusT';
    ext = '.mat';
  otherwise
    sensor_type = '';
    funcname = '';
    ext = '';
    status = 1;
    warning('Unknown instrument type for serial %s\n',serial)
end
