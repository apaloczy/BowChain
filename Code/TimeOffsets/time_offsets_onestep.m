function offsets = time_offsets_onestep(gridded)

offsets = zeros(size(gridded.t,1),1);
for i = 2:length(offsets)
  if sum(isnan(gridded.t(i-1,:))) > 0 || sum(isnan(gridded.t(i,:))) > 0
    offsets(i) = 0;
  else
  % Get time of steps
  ipt1 = findchangepts(gridded.t(i-1,:));
  ipt2 = findchangepts(gridded.t(i,:));
  % Get time offset
  offsets(i) = gridded.dn(ipt1) - gridded.dn(ipt2);
  % Plot shift
  figure
  plot(gridded.dn,gridded.t(i-1,:),gridded.dn,gridded.t(i,:),...
    gridded.dn + offsets(i),gridded.t(i,:))
  hold on
  scatter([gridded.dn(ipt1) gridded.dn(ipt2)],...
    [gridded.t(i-1,ipt1) gridded.t(i,ipt2)],'fill')
  title(['t_{offset} = ' num2str(offsets(i)*86400) ' [sec]'])
  legend('signal1','signal2','signal2 + offset')
  axis tight
  datetick('x','keeplimits')
  end
end
offsets = cumsum(offsets);
