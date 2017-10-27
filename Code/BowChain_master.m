%% BowChain_master.m
% Usage: BowChain_master(cruise,deployments)
% Inputs:      cruise - name of cruise 
%         deployments - (optional) A string, or cell array of strings, specifying
%                       which deployment(s) to process. By default, all deployments
%                       configured in the cruise's config file are processed.
% Outputs: grid - gridded dataset (cell array). 
% 
% Author: Dylan Winters


function grid = BowChain_master(cruise,varargin)

%% Setup
% Add dependencies to path
addpath(genpath('ParseFunctions'));   % instrument parsing functions
addpath(genpath('ChainModels'));      % bow chain shape models
addpath(genpath(['Cruise_' cruise])); % cruise-specific functions
config = get_config(cruise,varargin{:});      % get processing options

for i = 1:length(config)
    %% Preprocessing
    config = preproc_setup(config(i));   % set up filepaths & parse funcs
    config = dep_preproc(config(i));     % deployment-specific preprocessing
    config = preproc_raw2mat(config(i)); % convert raw data to .mat files

    %% Main processing
    data = proc_load_mat(config(i));
    grid{i} = proc_grid_init(data,config(i));
    grid{i} = dep_proc_pre_chain(grid,config(i));
    grid{i} = proc_grid_chain_offsets(grid,config(i));
end

