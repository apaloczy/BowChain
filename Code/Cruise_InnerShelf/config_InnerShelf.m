function config = config_InnerShelf()

dir_base = user_directories('InnerShelf');

%% Deployment configuration

% This config file looks a little different - it takes advantage of the
% pre-exisiting logsheets and organization!
pos_idx = 'A5:A24';
sn_idx = 'B5:B24';
type_idx = 'C5:C24';

for i = 1:10
    dname = sprintf('deployment%d',i);
    logsheet = fullfile(dir_base,'logsheets',['bowchain_' dname '.xlsx']);
    config(i).name = dname;
    config(i).dir_raw = fullfile(dir_base,[dname '/']);
    config(i).time_offset_method = 'cohere';
    config(i).sensor_sn = xlsread(logsheet,sn_idx);
    config(i).sensor_pos = xlsread(logsheet,pos_idx);
    % my code wants a cell array of strings for serial numbers... maybe not ideal
    sensor_sn = xlsread(logsheet,sn_idx);
    [~,sensor_type] = xlsread(logsheet,type_idx);
    config(i).sensor_sn = cell(size(sensor_sn));
    config(i).sensor_type = sensor_type;

    for s = 1:length(sensor_sn)
        switch lower(sensor_type{s})
          case {'solo', 'concerto', 'duet'}
            config(i).sensor_sn{s} = sprintf('%06d',sensor_sn(s));
          case {'gust'}
            config(i).sensor_sn{s} = sprintf('G%03d',sensor_sn(s));
        end
    end

    switch i
      case 1
        config(i).zero_pressure_interval = [7.3694774 7.3694786]*10^5;
        config(i).cohere_interval = [7.369475974421296e+05 7.369475975405093e+05];
        config(i).dn_range = [7.369471478182870e+05  7.369479453761574e+05];
      case 2
        config(i).zero_pressure_interval = [7.369486251099537 7.369487526273148]*10^5;
        config(i).cohere_interval = [7.369487526273148e+05 7.369487526620370e+05];
        config(i).dn_range = [7.369481038541667e+05 7.369487526620370e+05];
      case 3
        config(i).zero_pressure_interval = [7.369490073099884 7.369490353017691]*10^5;
        config(i).cohere_interval = [7.369505212585309e+05 7.369505214694102e+05];
        config(i).dn_range = [7.369490073099884e+05 7.369505214694102e+05];
      case 4
        config(i).zero_pressure_interval = [7.369506163098032 7.369506245399306]*10^5;
        config(i).cohere_interval = [7.369525198437501e+05 7.369525202218402e+05];
        config(i).dn_range = [7.369506163098032e+05 7.369525202218402e+05];
      case 5
        config(i).zero_pressure_interval = [7.369526243113426 7.369526249884259]*10^5;
        config(i).cohere_interval = [7.369536643344908e+05 7.369536644618056e+05];
        config(i).dn_range = [7.369526113657408e+05 7.369536706597222e+05];
      case 6
        config(i).zero_pressure_interval = [7.369537182918634 7.369537294097223]*10^5;
        config(i).cohere_interval = [7.369549804166667e+05 7.369549805381944e+05];
        config(i).dn_range = [7.369537182918634e+05 7.369549813381945e+05];
      case 7
        config(i).zero_pressure_interval = [7.369550225806452 7.369550474654378]*10^5;
        config(i).cohere_interval = [7.369559654417477e+05 7.369559655439815e+05];
        config(i).dn_range = [7.369550225806452e+05 7.369559655439815e+05];
      case 8
        config(i).zero_pressure_interval = [7.369560657841435 7.369561625817476]*10^5;
        config(i).cohere_interval = [7.369575241203704e+05 7.369575242281597e+05];
        config(i).dn_range = [7.369560657841435e+05 7.369575242281597e+05];
      case 9
        config(i).zero_pressure_interval = [7.369576073051736 7.369576382773959]*10^5;
        config(i).cohere_interval = [7.369589273032408e+05 7.369589279224537e+05];
        config(i).dn_range = [7.369576073051736e+05 7.369589279224537e+05];
      case 10
        config(i).zero_pressure_interval = [7.369594591941551 7.369595382826967]*10^5;
        config(i).cohere_interval = [7.369598732523149e+05 7.369598734201388e+05];
        config(i).dn_range = [7.369594591941551e+05 7.369598734201388e+05];
    end
end
