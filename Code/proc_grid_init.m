function gridded = proc_grid_init(data,config)

N = length(config.sensors);
perd_base =1/(config.freq_base*86400);

%% Initialize gridded variables
gridded = struct();
gridded.dn = (config.dn_range(1)-0.001):perd_base:(config.dn_range(2)+0.001);
flds = {'t','p','s','x','z'};
for f = 1:length(flds)
    gridded.(flds{f}) = nan(N,length(gridded.dn));
end

% Subsample/interpolate all data onto intermediate time base
for i = 1:length(data)
    % Determine interpolation method based on sampling period
    perd_sens = nanmean(diff(data{i}.dn));
    if perd_sens <= perd_base
        interp_method = 'nearest';
    else
        interp_method = 'linear';
    end

    % Interpolate data onto base_time
    for f = 1:length(flds)
        if isfield(data{i},flds{f})
            [~,idx] = unique(data{i}.dn);
            gridded.(flds{f})(i,:) = ...
                interp1(data{i}.dn(idx),data{i}.(flds{f})(idx),gridded.dn,...
                        interp_method);
        end
    end
    gridded.pos(i,:) = config.sensors(i).pos;
end

gridded.info = struct();

