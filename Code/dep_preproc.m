function config = dep_preproc(config)

if exist(['preproc_' config.cruise]) == 2
    config = feval(['preproc_' config.cruise]);
end