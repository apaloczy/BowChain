function grid = dep_proc_pre_chain(grid,config)

if exist([config.cruise 'proc_pre_chain']) == 2
    grid = feval([config.cruise 'proc_pre_chain'],grid,config);
end