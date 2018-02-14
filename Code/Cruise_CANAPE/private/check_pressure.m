gridded = rmfield(gridded,'p');
gridded = rmfield(gridded,'s');
for i = 1:length(gridded);
    gridded(i).name = sprintf('T%d',i)
    % gridded(i).pos = gridded(i).pos(:,1);
end

>> data

data = 

  1x6 struct array with fields:

    dn
    t
    pos
    name

>> data(1)

ans = 

  struct with fields:

      dn: [1x3335058 double]
       t: [10x3335058 double]
     pos: [10x1 double]
    name: 'T1'
