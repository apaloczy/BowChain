function grid = post_chain_hook(grid, cfg)

func = [cfg.cruise '_post_chain_hook'];
if exist(func) == 2
    grid = feval(func,grid,cfg);
end
