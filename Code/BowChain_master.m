function BowChain_master(cruise,dep)

%% Setup
% Add dependencies to path
addpath(genpath('ParseFunctions'));   % instrument parsing functions
addpath(genpath('ChainModels'));      % bow chain shape models
addpath(genpath(['Cruise_' cruise])); % cruise-specific functions
config = get_config(cruise,dep);      % get processing options

%% Preprocessing
config = preproc_setup(config);   % set up filepaths & parse funcs
config = dep_preproc(config);     % deployment-specific preprocessing
config = preproc_raw2mat(config); % convert raw data to .mat files

%% Main processing
data = proc_load_mat(config);
grid = proc_grid_init(data,config);
grid = dep_proc_pre_chain(grid,config);
grid = proc_grid_chain_offsets(grid,config);


