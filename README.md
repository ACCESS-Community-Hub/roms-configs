# Model configuration files for the Regional Ocean Modelling System (ROMS)
**Note that the [main](https://github.com/ACCESS-Community-Hub/roms-configs) branch does not store any configuration, only some documentation**. 
If you are looking to fork this repo, we suggest you fork all branches.
This is a repository of input files for running different ROMS configurations.
There are multiple configurations in this repository, with each unique configuration being stored on a seperate branch. 

# Running ROMS and the configurations in this repository
## Introduction
The regional ocean modelling system (ROMS) is an ocean model that can be configured from different regions. More information is available on the [ROMS website](https://www.myroms.org). Users are advised to sign up to the [ROMS modelling community](https://www.myroms.org/index.php?page=RomsCode) for support and development updates.

The instructions below outline how to run ROMS using ACCESS-NRI's deployed software, on on NCI's supercomputer Gadi.

All configurations in this repository are open source, licensed under CC BY 4.0CC iconBY icon and available on ACCESS-Community-Hub on GitHub.

## Prerequisites
**NCI Account**

Before running this ROMS workflow you need to [Set Up your NCI Account](https://docs.access-hive.org.au/getting_started/set_up_nci_account/)

**Join NCI projects**

Join the following projects by requesting membership on their respective NCI project pages:

[yj27](https://my.nci.org.au/mancini/project/yj27)

[vk83](https://my.nci.org.au/mancini/project/vk83)

For more information on joining specific NCI projects, refer to [How to connect to a project](https://opus.nci.org.au/spaces/Help/pages/13141289/How+to+connect+to+a+project).

## Running the upwelling example
From Gadi, you need to run these commands:

```
module use /g/data/vk83/prerelease/modules;
module load payu/dev
mkdir -p ~/ancoms-roms
cd ~/ancoms-roms/
payu clone -B release-upwelling+testcase https://github.com/ACCESS-Community-Hub/roms-configs.git upwelling+testcase
cd upwelling+testcase
payu run
```

These commands load up payu (our workflow manager), create a folder to store the files, download the files and submit the run.

## Running the EAC example
Note these instructions assume you have already created your ancoms-roms folder and have payu loaded (as above). These are the commands
```
cd ~/ancoms-roms/
payu clone -B dev-eac4km_barra-ecmwf https://github.com/ACCESS-Community-Hub/roms-configs.git eac4km_barra-ecmwf
cd eac4km_barra-ecmwf
payu run

```
