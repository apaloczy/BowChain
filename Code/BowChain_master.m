function BowChain_master(cruise,dep)

%% Setup
% Add dependencies to path
addpath(genpath('ParseFunctions'));   % instrument parsing functions
addpath(genpath(['Cruise_' cruise])); % cruise-specific functions

% Get processing options
config = get_config(cruise,dep);

%% Preprocessing
config = preproc_setup(config);   % set up filepaths & parse funcs
config = preproc_dep(config);     % deployment-specific preprocessing
config = preproc_raw2mat(config); % convert raw data to .mat files


%% Main processing
data = proc_load_mat(config);
