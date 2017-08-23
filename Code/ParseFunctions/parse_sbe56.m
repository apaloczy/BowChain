function data = parse_sbe56(f_in)
    sbe = cnv2mat_SBE56_UMQ13(f_in,'','',0,0);
    data = struct();
    data.dn = sbe.dtnum;
    data.temp = sbe.temp;
end