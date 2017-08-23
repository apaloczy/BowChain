function data = parse_rbr_solo(f_in)
    data = struct();
    [rbr,dbid] = RSKopen(f_in);
    solo = RSKreaddata(rbr);
    data.dn = solo.data.tstamp;
    data.t = solo.data.values;
end