function offsets = time_offsets_onestep(gridded)

offsets = zeros(size(gridded.t,1),1);
for i = 2:length(offsets)
  % Time indecies of no nans
  tinds = find(~isnan(gridded.t(i-1,:)) & ~isnan(gridded.t(i,:)));
  % Shorten timeseries to remove nans
  signal1 = gridded.t(i-1,tinds);
  signal2 = gridded.t(i,tinds);
  % Get skill of lagged covariance
  [lag,skill]=cov_lag(signal1,signal2,round(length(signal1)/2));
  % Find max skill
  [~,i_lag] = max(skill);
  % Get offset
  offsets(i) = lag(i_lag)*mean(diff(gridded.dn));
  
  % Plot Signals with shift
  figure
  plot(gridded.dn,gridded.t(i-1,:),gridded.dn,gridded.t(i,:),...
    gridded.dn + offsets(i),gridded.t(i,:))
  hold on
  title(['t_{offset} = ' num2str(offsets(i)*86400) ' [sec]'])
  legend('signal1','signal2','signal2 + offset')
  axis tight
  datetick('x','keeplimits')
  pause(.01)
  % end
end
offsets = cumsum(offsets);
end

function [lag,skill] = cov_lag(s1,s2,N)
% [lag,skill, sign]=cov_lag(s1,s2,N)
% +ve lags => s1 leads s2
% -ve lags => s2 leads s1
lag=-N:N;
skill = lag*NaN;

for i=1:length(lag)
  L = abs(lag(i));
  if lag(i)>=0								%+ve lags => s1 leads s2
    s1_L=s1(L+1:end);
    s2_L=s2(1:end-L);
  else									%-ve lags => s2 leads s1
    s1_L=s1(1:end-L);
    s2_L=s2(L+1:end);
  end
  
  C=cov(s1_L,s2_L);
  skill(i)=C(1,2)^2/(C(1,1)*C(2,2));
  clear C s1_L s2_L
end
clear  L i
end