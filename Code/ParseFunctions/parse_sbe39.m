function data = parse_sbe39(f_in)
    data = struct();
    sbe = asc2mat_SBE39(f_in,'','',0,0);
    data.dn = sbe.dtnum;
    data.temp = sbe.temp;
    data.pr = sbe.pr;
end