%% BowChain_master.m
% Usage: BowChain_master(cruise,deployments)
% Inputs:      cruise - name of cruise 
%         deployments - (optional) A string, or cell array of strings, specifying
%                       which deployment(s) to process. By default, all deployments
%                       configured in the cruise's config file are processed.
% Outputs: gridded - gridded dataset (cell array). 
% 
% Author: Dylan Winters


function gridded = BowChain_master(cruise,varargin)

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
    disp(sprintf('Processing deployment: %s',cfg.name));
    cfg = preproc_setup(cfg);   % set up filepaths & parse funcs
    preproc_raw2mat(cfg); % convert raw data to .mat files if necessary
    data = proc_load_mat(cfg); % load raw data

    %% Main processing
    % 1) Any user-defined preprocessing
    [data, cfg] = post_load_hook(data,cfg);
    % 2) Compute time offsets and sample to uniform time-base
    gridded(i) = proc_time_offsets(data,cfg);
    gridded(i) = post_grid_hook(gridded(i),cfg);
    % 4) Compute positional offsets using chain shape model
    gridded(i) = proc_pressure_cal(gridded(i),cfg);
    gridded(i) = proc_chain_model(gridded(i),cfg);
    gridded(i) = post_chain_hook(gridded(i),cfg);
    gridded(i) = proc_gps(gridded(i),cfg);
    gridded(i).info.config = cfg;
end

