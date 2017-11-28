function grid = post_grid_hook(grid, cfg)

func = [cfg.cruise '_post_grid_hook'];
if exist(func) == 2
    grid = feval(func,grid,cfg);
end
