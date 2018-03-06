function data = parse_rbr_concerto(f_in)
    data = struct();
    [rbr,dbid] = RSKopen(f_in);
    tmp = RSKreaddata(rbr);
    data.dn = tmp.data.tstamp;
    data.c = tmp.data.values(:,1);
    data.t = tmp.data.values(:,2);
    data.p = tmp.data.values(:,3);
    % include code to add salinity to structure here
end

