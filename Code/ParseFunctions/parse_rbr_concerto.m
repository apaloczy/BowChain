function data = parse_rbr_concerto(f_in)
    data = struct();
    [rbr,dbid] = RSKopen(f_in);
    tmp = RSKreaddata(rbr);
    data.dn = tmp.data.tstamp;
    data.cond = tmp.data.values(:,1);
    data.temp = tmp.data.values(:,2);
    data.pr = tmp.data.values(:,3);
end

