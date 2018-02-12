function [data,cfg] = InnerShelf_post_load_hook(data,cfg);

for i = 1:length(data)
    switch data{i}.sn
      case {'G049','G050'};
        d = struct();
        d.dn = data(sns{i}).GusT.dnum;
        d.t = data(sns{i}).GusT.t;
        d.p = data(sns{i}).GusT.p;
        data{i} = d;
    end
end
