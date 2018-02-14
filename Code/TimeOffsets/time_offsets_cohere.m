function data = time_offsets_cohere(gridded,data,cfg);

offsets = zeros(size(gridded.t,1),1);
for i = 2:length(offsets)
  % Get time offset
  offsets(i) = determine_t_offset(gridded.dn',gridded.t(i-1,:)',...
                                  gridded.dn',gridded.t(i,:)',cfg.cohere_interval);
end
offsets = cumsum(offsets);

for i = 1:length(data)
    data{i}.dn = data{i}.dn + offsets(i);
    disp(sprintf('Removed %.1f second offset from %s',offsets(i)*86400,data{i}.sn));
    close all
end

gridded.info.time_offsets = sprintf(...
    ['Time offsets determined using "cohere" method'...
     ' on interval %s to %s'],...
    datestr(cfg.cohere_interval(1)),...
    datestr(cfg.cohere_interval(2)));


