function preproc_dep(config)

if exist(['preproc_' config.cruise]) == 2
    feval(['preproc_' config.cruise])
end