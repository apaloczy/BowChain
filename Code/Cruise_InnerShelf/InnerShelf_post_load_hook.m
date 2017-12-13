function [data,cfg] = InnerShelf_post_load_hook(data,cfg);

sns = keys(data);
for i = 1:length(sns)
    switch sns{i}
      case {'G049','G050'};
        d = struct();
        d.dn = data(sns{i}).GusT.dnum;
        d.t = data(sns{i}).GusT.t;
        d.p = data(sns{i}).GusT.p;
        data(sns{i}) = d;
    end
end
