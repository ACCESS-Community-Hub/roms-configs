# roms-configs
A repository of input files for running ROMS configurations.
Each branch contains files for a different configuration. 

# Instructions for running

## Initial setup
You need an account on Gadi and to join these projects: yj27, vk83

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
