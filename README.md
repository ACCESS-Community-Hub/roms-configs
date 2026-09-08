# Model configuration files for the Regional Ocean Modelling System (ROMS)
**Note that the [main](https://github.com/ACCESS-Community-Hub/roms-configs) branch does not store any configuration, only some documentation**. 

If you are looking to fork this repo, we suggest you fork all branches.

This is a repository of input files for running different ROMS configurations.
There are multiple configurations in this repository, with each unique configuration being stored on a seperate branch. 

# Running ROMS and the configurations in this repository
## Quick start
The commands needed to run a configuration are:
```
module use /g/data/vk83/prerelease/modules;
module load payu/dev
mkdir -p ~/ancoms-roms
cd ~/ancoms-roms/
payu clone -B release-upwelling+testcase https://github.com/ACCESS-Community-Hub/roms-configs.git upwelling+testcase
cd upwelling+testcase
payu run
```

This will run the upwelling test case. To run a different example, change `release-upwelling+testcase` to the name of the branch that you want to run and `upwelling+testcase` to the name you want to use for your run.

The below information will provide some more details and context to these instructions.


## Introduction
[The Regional Ocean Modelling System (ROMS)](https://www.myroms.org) is an ocean model that can be configured to run for user-specified domains and processes. This repository stores the input files needed for specific configurations developed by the Australian research community. Users are advised to sign up to the [ROMS modelling community](https://www.myroms.org/index.php?page=RomsCode) for support and development updates.

The instructions below outline how to run these ROMS configurations using ACCESS-NRI's deployed software, on NCI's supercomputer Gadi.

All configurations in this repository are open source, licensed under CC BY 4.0CC iconBY icon and available on ACCESS-Community-Hub on GitHub.

## Prerequisites
* **NCI Account**<br> 
  Before running this ROMS workflow you need to [Set Up your NCI Account](https://docs.access-hive.org.au/getting_started/set_up_nci_account/)

* **Join NCI projects**<br> 
  Join the following projects by requesting membership on their respective NCI project pages:
  * [yj27](https://my.nci.org.au/mancini/project/yj27)
  * [vk83](https://my.nci.org.au/mancini/project/vk83)

  For more information on joining specific NCI projects, refer to [How to connect to a project](https://opus.nci.org.au/spaces/Help/pages/13141289/How+to+connect+to+a+project).

* **Payu**<br>
    [Payu](https://github.com/payu-org/payu) is a workflow management tool for running numerical models in supercomputing environments, for which there is extensive [documentation](https://payu.readthedocs.io/en/latest/).<br>
    _Payu_ on _Gadi_ is available through a dedicated `conda` environment in the _vk83_ project.<br>
    After joining the _vk83_ project, load the `payu` module:
  ```
  module use /g/data/vk83/modules
  module load payu
  ```

    To check that _payu_ is available, run:

  ```
  payu --version
  ```

# Download and run a ROMS configuration on Gadi

The ROMS configurations in this repository can be run on [Gadi](https://opus.nci.org.au/spaces/Help/pages/90308778/0.+Welcome+to+Gadi#id-0.WelcometoGadi-Overview) through a [PBS job](https://opus.nci.org.au/display/Help/4.+PBS+Jobs) submission managed by *[payu](https://github.com/payu-org/payu)*.

The general layout of a payu supported model run consists of two main directories:

The control directory contains the model configuration and serves as the execution directory for running the model (in this example, the cloned directory ~/ancoms-roms/upwelling+testcase).
The laboratory directory, where all the model components reside. This will typically be /scratch/$PROJECT/$USER/ancoms-roms. Payu automatically creates this directory when a model configuration is run.
This separates the small text configuration files from the larger binary outputs and inputs. In this way, the control directory can be in the $HOME directory (as it is the only filesystem actively backed-up on Gadi). The quotas for $HOME are low and strict, which limits what can be stored there, so it is not suitable for larger files.

The laboratory directory is a shared space for all payu experiments using the same model.
Inside the laboratory directory there are two subdirectories:

* work -> a directory where payu automatically creates a temporary subdirectory while the model is run. The temporary subdirectory gets created as part of a run and then removed after the run succeeds.
* archive → the directory where the output is stored following each successful run.

Within each of the above directories *payu* automatically creates subdirectories uniquely named according to the experiment being run.
Payu also creates symbolic links in the control directory pointing to the archive and work directories.


This design allows multiple self-resubmitting experiments that share common executables and input data to be run simultaneously.
## Warning
Files on the /scratch drive, such as the laboratory directory, might get deleted if not accessed for several days and the /scratch drive is limited in space. For these reasons, we strongly recommend that all model runs which are to be kept should be moved to /g/data/ by enabling the sync step in payu ([see documentation](https://payu.readthedocs.io/en/stable/config.html).

## Get ROMS configuration
All released branches on this repository can be run using *payu*

The first step is to choose a configuration from those available. For example, to run the standard [ROMS upwelling test case](https://www.myroms.org/wiki/UPWELLING_CASE), one should select the branch release-MC_25km_jra_ryf.

To clone this branch to a location on Gadi and navigate to that directory, run:
```
mkdir -p ~/ancoms-roms
cd ~/ancoms-roms/
payu clone -B release-upwelling+testcase https://github.com/ACCESS-Community-Hub/roms-configs.git upwelling+testcase
cd upwelling+testcase
```
In the example above, the payu clone command clones the latest release of the upwelling example (-B release-upwelling+testcase) to a directory named upwelling+testcase and creates a new experiment branch (-b expt). To run a different example, such as EAC configuration, then the payu clone command needs modifying to point to the different configuration:
```
payu clone -B dev-eac4km_barra-ecmwf https://github.com/ACCESS-Community-Hub/roms-configs.git eac4km_barra-ecmwf
cd eac4km_barra-ecmwf
```

For further details, [refer to payu documentation on cloning an experiment](https://payu.readthedocs.io/en/stable/usage.html#clone-experiment).

## Run configuration
To run the cloned ROMS configuration, execute the following command from within the control directory:
```
payu run
``
This will submit a single job to the supercomputer "queue" with the run length specified in the configuration.
