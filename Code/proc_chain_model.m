function grid = proc_chain_model(grid,cfg)
grid = feval(cfg.chain_model,grid,cfg);
