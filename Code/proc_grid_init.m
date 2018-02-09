function grid = proc_grid_init(data,config)

N = length(config.sensors);
perd_base =1/(config.freq_base*86400);

%% Initialize grid variables
grid = struct();
grid.dn = (config.dn_range(1)-0.001):perd_base:(config.dn_range(2)+0.001);
flds = {'t','p','s','x','z'};
for f = 1:length(flds)
    grid.(flds{f}) = nan(N,length(grid.dn));
end

% Subsample/interpolate all data onto intermediate time base
for i = 1:N
    sn = config.sensors(i).sn;
    % Determine interpolation method based on sampling period
    perd_sens = nanmean(diff(data(sn).dn));
    if perd_sens <= perd_base
        interp_method = 'nearest';
    else
        interp_method = 'linear';
    end

    % Interpolate data onto base_time
    for f = 1:length(flds)
        if isfield(data(sn),flds{f})
            [~,idx] = unique(data(sn).dn);
            grid.(flds{f})(i,:) = ...
                interp1(data(sn).dn(idx) ,...
                        data(sn).(flds{f})(idx) ,...
                        grid.dn ,...
                        interp_method);
        end
    end
    grid.pos(i,:) = config.sensors(i).pos;
end

grid.info = struct();

