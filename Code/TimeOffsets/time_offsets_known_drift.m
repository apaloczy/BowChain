function data = time_offsets_known_drift(data,cfg);

for i = 1:length(cfg.sensor_sn)
    dn0 = cfg.time_synched;
    d = data(cfg.sensor_sn{i});
    dn = d.dn;
    drift = interp1([dn0 dn(end)],[0 cfg.drift(i)/86400], dn);
    d.dn = dn - drift;
    data(cfg.sensor_sn{i}) = d;
    disp(sprintf('Removed %d second clock drift from %s',cfg.drift(i),cfg.sensor_sn{i}));
end

gridded.info.time_offsets = ...
    'Clocks corrected using known synch time and measured drift';

