function [data,cfg] = ArcticMix_post_load_hook(data,cfg)

% Remove 10dbar nominal atmospheric pressure from pressure sensor data
for i = 1:length(data)
    if isfield(data{i},'p')
        data{i}.p = data{i}.p - 10;
    end
end
