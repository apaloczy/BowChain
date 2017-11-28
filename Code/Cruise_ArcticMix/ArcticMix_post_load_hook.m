function [data,cfg] = ArcticMix_post_load_hook(data,cfg)

% Remove 10dbar nominal atmospheric pressure from pressure sensor data
for sn_cell = keys(data)
    sn = char(sn_cell);
    d = data(sn);
    if isfield(d,'p')
        d.p = d.p - 10;
        data(sn) = d;
    end
end
