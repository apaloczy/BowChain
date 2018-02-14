function [data,cfg] = InnerShelf_post_load_hook(data,cfg);

% proc_load_mat.m loaded pre-existing GusT datafiles. Convert these to a format
% consistent with output returned by the rest of the parsing functions.
for i = 1:length(cfg.sensors)
    switch cfg.sensors(i).sn
      case {'G049','G050'};
        d = struct();
        d.dn = data{i}.GusT.dnum;
        d.t = data{i}.GusT.t;
        d.p = data{i}.GusT.p;
        d.sn = cfg.sensors(i).sn;
        data{i} = d;
    end
end
