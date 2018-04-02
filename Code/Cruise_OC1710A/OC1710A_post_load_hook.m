function [data,cfg] = OC1710A_post_load_hook(data,cfg)

% Remove large UTC/local time offsets
switch cfg.name
  case 'deployment_2'
    for i = 1:length(data)
        if ismember(data{i}.sn,...
                    {'100701';
                     '100699';
                     '100696';
                     '100695';
                     '101162';
                     '100693';
                     '101158';
                     '100154';
                     '101159';
                     '100153'})
            data{i}.dn = data{i}.dn + 7/24;
        end
    end
  case 'deployment_3'
    for i = 1:length(data)
        if ismember(data{i}.sn,{'101158'})
            data{i}.dn = data{i}.dn + 7/24;
        end
    end
end
