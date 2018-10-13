function out = postproc_grid_data(gridded,cfg)

%% Check for bin method
if ~isfield(cfg,'bin_method')
    warning('No bin method specified. Returning point cloud!')
    out = gridded;
    return
end

%% Check for valid GPS data
if isfield(cfg,'file_gps') % Make sure we have a GPS file specified
    gps = load(cfg.file_gps);
    % Check for missing fields
    flds = fields(gps);
    req_flds = {'dn','lat','lon'};
    missing_flds = setdiff(req_flds,flds);
    if length(missing_flds) > 1
        warning('GPS file is missing fields: %s. Returning point cloud!',...
                strjoin(missing_flds,', '))
        out = gridded;
        return
    end
end

%% Define bin edges for time/lateral space dimension
switch cfg.bin_method
  case 'time'
    %%% Project sensor measurements onto slice beneath ship and bin in time

    %% Compute ship speed from GPs data
    % remove non-unique timestamps
    [~,idx] = unique(gps.dn);
    dn = gps.dn(idx);
    lt = gps.lat(idx);
    ln = gps.lon(idx);
    % remove NaNs
    idx = ~isnan(dn.*lt.*ln);
    dn = dn(idx);
    lt = lt(idx);
    ln = ln(idx);
    % compute velocity
    wgs84 = referenceEllipsoid('wgs84','m');
    lt0 = nanmean(lt);
    ln0 = nanmean(ln);
    lt2y = distance('rh',lt0-0.5,ln0,lt0+0.5,ln0,wgs84); % meters N/S per deg N
    ln2x = distance('rh',lt0,ln0-0.5,lt0,ln0+0.5,wgs84); % meters E/W per deg W at lat lt0
    y  =  lt2y * (lt-lt0) ; % meters N/S
    x  =  ln2x * (ln-ln0) ; % meters E/W
    dt = diff(dn)*86400;
    t  = dn(1:end-1) + diff(dn)/2;
    vx = interp1(t, diff(x)./dt, gridded.dn);
    vy = interp1(t, diff(y)./dt, gridded.dn);
    spd = sqrt(vx.^2 + vy.^2); %[m/s]

    %% Apply speed-dependent sensor time offsets
    spd2 = ones(length(gridded.pos),1)*spd;
    dn_base = ones(length(gridded.pos),1)*gridded.dn;
    dn_offset = dn_base - ((gridded.x ./ spd2)./86400);
    dn_offset(spd2 == 0) = 0;

    %% Bin the data
    % define the z grid
    out.z = cfg.bin_zgrid;
    % define bin edges and output time vector
    dt = cfg.binned_period/86400; % convert binned period to days (datenum)
    tbin = gridded.dn(1):dt:gridded.dn(end); % bin edges
    out.dn = tbin(1:end-1) + dt/2; % use bin centers for output time vector
    % grid the scattered data
    flds = {'t','s'};
    [dnq,zq] = meshgrid(out.dn,out.z);
    for i = 1:length(flds)
        F = scatteredInterpolant(dn_offset(:),gridded.z(:),...
          gridded.(flds{i})(:));
        out.(flds{i}) = F(dnq,zq);
    end

    out.lat = interp1(gps.dn,gps.lat,out.dn);
    out.lon = interp1(gps.dn,gps.lon,out.dn);

    if isfield(cfg,'include_config') && cfg.include_config
        out.config = cfg;
    end

  case 'space'
    % Assign a lat/lon to each measurement and then bin spatially
    warning('''Space'' bin method not yet implemented. Returning point cloud!');
    return
end

