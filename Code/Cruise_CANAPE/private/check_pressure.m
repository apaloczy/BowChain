grid = rmfield(grid,'p');
grid = rmfield(grid,'s');
for i = 1:length(grid);
    grid(i).name = sprintf('T%d',i)
    % grid(i).pos = grid(i).pos(:,1);
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