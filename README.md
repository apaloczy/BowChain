
# Table of Contents

1.  [Overview](#orgb2fe9a9)
    1.  [Cruise and deployment configuration](#org2b35946)
    2.  [Deployment processing](#org8cf2b04)
2.  [Setup](#orgd83b93c)
    1.  [BowChain](#orga3ebf06)
    2.  [RSKOpen/mksqlite](#org31b40f8)
3.  [Configuration](#orgbcc01f5)
    1.  [Deployment configuration](#orgfc6c2dd)
    2.  [Instrument configuration](#org22354e9)
    3.  [Setting configuration options with fill<sub>defaults</sub>](#org695a20a)



<a id="orgb2fe9a9"></a>

# Overview

Process a bow chain dataset using `BowChain_master(cruiseName,deploymentName)`.

`BowChain_master.m` is structured as follows:


<a id="org2b35946"></a>

## Cruise and deployment configuration

The cruise's configuration function is called using `get_config.m`. This fills
the cruise's config structure with global default options from
`config_default.m` and checks deployments for missing options.


<a id="org8cf2b04"></a>

## Deployment processing

Each deployment is processed sequentially with the following steps:

1.  Sensor setup (`preproc_setup.m`)
    -   The user-defined sensor serial numbers are passed into
        `get_sensor_info.m`. This function acts as a database containing
        processing instructions for different sensor types.
    -   If the instrument type is known and an associated raw datafile is found,
        the sensor gets an entry in `config.sensors` containing parsing
        instructions and an output .mat file name.

2.  File conversion (`preproc_raw2mat.m`)
    -   Using the information gathered in `preproc_setup`, each sensor's raw
        datafiles are convered to a .mat format. This step is skipped if .mat
        files already exist.

3.  Load data
    -   Each sensor's .mat file is loaded using `proc_load_mat.m`. This creates a
        `data` cell array with raw sensor data in each cell.

4.  Sample data onto a uniformly-spaced time base using `proc_grid_init`.

5.  Calibrate sensor clocks and pressure sensors
    -   Clocks are calibrated using `proc_time_offsets.m`. The
        `config.time_offset_method` and related fields control what this function
        does.
    -   Pressure sensors are calibrated with `proc_pressure_cal` if the
        `config.zero_pressure_interval` field is defined.

6.  Apply positional offsets to measurements
    -   `proc_chain_model.m` uses known instrument positions and measured
        pressure data to compute positional offsets for each measurement. This
        adds an `x` and `z` field to the gridded data structure.


<a id="orgd83b93c"></a>

# Setup


<a id="orga3ebf06"></a>

## BowChain

Clone the git repository:

    git clone https://github.com/dswinters/BowChain.git

Copy the `user_directories.m.example` file to `user_directories.m`:

    cd BowChain/Code
    cp user_directories.m.example user_directores.m

`user_directories.m` is not tracked in the repository. This allows the user to
maintain a personal list of cruise data locations (local folders, remote
directories, external volumes, etc.) without needing to modify configuration
files.


<a id="org31b40f8"></a>

## RSKOpen/mksqlite

*Note: If you've successfully used `RSKopen` previously, you can skip this step.*

This code uses RBR's `RSKopen` code for reading RBR datafiles. `RSKopen` is included in the `BowChain` repository, but requires a working version of `mksqlite`, a MATLAB interface for `sqlite`. 

First clone the `mksqlite` repository:

    git clone https://github.com/AndreasMartin72/mksqlite.git

Compiling `mksqlite` may take some fiddling. I had success with gcc-4.8 after making the following change to `buildit.m`:

    - mexargs = ' CFLAGS="\$CFLAGS" CXXFLAGS="\$CXXFLAGS std=gnu++0x" ';
    + mexargs = ' CXX="g++-4.8" GCC="gcc-4.8" CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" ';

After this, `buildit` completes successfully and creates `mksqlite.mexa64` or similar. Put this on your MATLAB path.


<a id="orgbcc01f5"></a>

# Configuration


<a id="orgfc6c2dd"></a>

## Deployment configuration

Within the [Code](Code/) directory, cruise-specific folders contain information needed to
locate and process deployment data. Each cruise needs a `<cruise>_config` file
that returns a structure containing configuration information for each
deployment.

For example, [Cruse<sub>ArcticMix</sub>/config<sub>ArcticMix.m</sub>](Code/Cruise_ArcticMix/config_ArcticMix.m) creates a structure containing
deployment information for the ArcticMix cruise. Only one deployment entry is
shown below:

    %% Deployment setup
    config(1).name = 'MooringToIce'
    config(1).dir_raw = '/path/to/raw/data/11sept_1900_recovery';
    config(1).dn_range = datenum([...
        '09-Sep-2015 21:49:40';
        '10-Sep-2015 08:36:14']);
    config(1).sensor_sn ={'00451';'100161';'100154';'060281';'00407';'100160';...
                          '100153';'00445';'100157';'00422';'100159';'100158';'00442';...
                          '100162';'03253';'100155';'00392';'00372';'060280';'100156'};
    config(1).sensor_pos = [0 1 2 3 4 5 6 7 8 9 11 12 13 14 14.5 15 16 17 18 19];


### Deployment configuration options

Base parameters

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Field</th>
<th scope="col" class="org-left">Description</th>
<th scope="col" class="org-left">Default</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">config.name</td>
<td class="org-left">deployment name</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">config.dir.raw</td>
<td class="org-left">raw deployment data directory</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">config.sensor<sub>sn</sub></td>
<td class="org-left">cell array of sensor serial number strings</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">config.sensor<sub>pos</sub></td>
<td class="org-left">vector of sensor positions</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">config.dn<sub>range</sub></td>
<td class="org-left">time interval for deployment</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">config.freq<sub>base</sub></td>
<td class="org-left">frequency of gridded output data</td>
<td class="org-left">2 Hz</td>
</tr>


<tr>
<td class="org-left">config.time<sub>offset.method</sub></td>
<td class="org-left">method for sensor clock corrections</td>
<td class="org-left">'none'</td>
</tr>


<tr>
<td class="org-left">config.zero<sub>pressure</sub><sub>interval</sub></td>
<td class="org-left">time interval for zero-pressure calibration</td>
<td class="org-left">no pressure calibration</td>
</tr>


<tr>
<td class="org-left">config.chain<sub>model</sub></td>
<td class="org-left">model to use for instrument position corrections</td>
<td class="org-left">'cm<sub>straight</sub>'</td>
</tr>
</tbody>
</table>

Some configuration options require additional fields in the `config` structure:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Field</th>
<th scope="col" class="org-left">Value</th>
<th scope="col" class="org-left">Additional Required Field</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">config.time<sub>offset</sub><sub>method</sub></td>
<td class="org-left">'cohere'</td>
<td class="org-left">config.cohere<sub>interval</sub></td>
<td class="org-left">Interval to use for clock calibration</td>
</tr>


<tr>
<td class="org-left">config.time<sub>offset</sub><sub>method</sub></td>
<td class="org-left">'known<sub>drift</sub>'</td>
<td class="org-left">config.time<sub>synched</sub></td>
<td class="org-left">Time (datenum,UTC) that clocks were synched</td>
</tr>


<tr>
<td class="org-left">config.time<sub>offset</sub><sub>method</sub></td>
<td class="org-left">'known<sub>drift</sub>'</td>
<td class="org-left">config.drift</td>
<td class="org-left">Measured clock drift on recovery</td>
</tr>
</tbody>
</table>


### Locating instrument data

Data organization might change between cruises, but is likely consistent for
each cruise. By default, it is assumed that all raw data files (from every
instrument) reside in the deployments `config.dir_raw` folder.

Within each cruise folder, an optional `sensor_dirs_<cruise>` function can be
defined if more complex organization is required. This function takes a
deployment's config structure entry and an instrument serial number as input and
returns a new directory name for that particular instrument's raw data folder.

Again using the ArctixMix deployment example:

In the case of the *MooringToIce* deployment, raw instrument data was organized
into instrument-specific directories within the `config.dir_raw` folder. The
[sensor<sub>dirs</sub><sub>ArcticMix</sub>](Code/Cruise_ArcticMix/sensor_dirs_ArcticMix.m) function is thus straightforward - we just need to append
the serial number to the deployment's `config.dir_raw` field.

    function sensor_dir = sensor_dirs_ArcticMix(config,sn)
    sensor_dir = fullfile(config.dir_raw,sn);

Note that since the `config` structure contains the deployment's name, and a
single instrument serial number is given as input, this function allows for
extreme flexibility down to the level of instrument-specific folders on a
per-deployment basis. This is hopefully not required with good data
organization!


<a id="org22354e9"></a>

## Instrument configuration

Each instrument is linked to an instrument type via its serial number, and each
instrument type is linked to a parsing function and a raw data file extension.
This is all done in [get<sub>sensor</sub><sub>info.m</sub>](Code/get_sensor_info.m), which takes a serial number string as
input.

**Any instruments that I have not encountered will not be included in this list!**
Fortunately, associating serial numbers to instruments can be easily done by
modifying the first few lines of [get<sub>sensor</sub><sub>info</sub>](Code/get_sensor_info.m) to include new serial numbers:

    %% Instrument serial numbers
    
    % SBE39
    sbe39 = {'03253'};
    
    % SBE56
    sbe56 = {'00372','00392','00407','00422','00442','00445','00451'};
    
    % RBR Solo
    rbr_solo = {'100153','100154','100155','100156','100157','100158',...
                '100159','100160','100161','100162'};
    
    % RBR Concerto
    rbr_concerto = {'060280','060281'};

This method allows finding and parsing raw data to be generalized to a function
of instrument serial number, but requires wrappers around low-level instrument
parsing functions so that the output data format is consistent across all
instrument types. This makes adding a new instrument type require some
additional modificatons.

The following files in the [Code/ParseFunctions/](Code/ParseFunctions/) directory are all examples of
such "wrapper" functions:

-   <Code/ParseFunctions/parse_rbr_concerto.m>
-   <Code/ParseFunctions/parse_rbr_solo.m>
-   <Code/ParseFunctions/parse_sbe39.m>
-   <Code/ParseFunctions/parse_sbe56.m>

These functions are simple, but necessary - they call low-level raw
data parsing functions and restructure the output to facilitate later data
processing.

See the latter half of [get<sub>sensor</sub><sub>info.m</sub>](Code/get_sensor_info.m) for associations between instrument
types and parsing functions.


<a id="org695a20a"></a>

## Setting configuration options with fill<sub>defaults</sub>

This section can be safely ignored, but might be useful.

The [fill<sub>defaults</sub>](Code/fill_defaults.m) function can be used at any stage of setup to apply a set of
default options to a cruise's deployment configuration structure. It is used in
the core code to apply the default `freq_base` and `chain_model` parameters
shown in the table above. Only options that are undefined will be filled -
existing options will not be overwritten.

