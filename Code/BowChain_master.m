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
addpath(genpath('TimeOffsets'));      % Sensor clock offset computation methods
addpath(genpath('Hooks'));            % Hook functions
addpath(genpath(['Cruise_' cruise])); % cruise-specific functions

config = get_config(cruise,varargin{:}); % get processing options

for i = 1:length(config)
    %% Preprocessing
    cfg = config(i);
    cfg = preproc_setup(cfg);   % set up filepaths & parse funcs
    cfg = preproc_raw2mat(cfg); % convert raw data to .mat files

    %% Main processing
    % 1) Load the data that we've already converted to .mat files
    data = proc_load_mat(cfg);
    [data, cfg] = post_load_hook(data,cfg);
    % 2) Sample all data onto nominal time base
    grid(i) = proc_grid_init(data,cfg);
    grid(i) = post_grid_hook(grid(i),cfg);
    % 3) Compute and/or apply time offsets and resample
    grid(i) = proc_time_offsets(grid(i),data,cfg);
    % 4) Compute positional offsets using chain shape model
    grid(i) = proc_chain_model(grid(i),cfg);
    grid(i) = post_chain_hook(grid(i),cfg);
end

