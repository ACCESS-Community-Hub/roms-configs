# roms-configs
A repository of input files for running ROMS configurations.
Each branch contains files for a different configuration. 


To run this configuration you need to have an account on Gadi and to join these projects: yj27 and vk83.
Then you can run the configuration with these commands:
```
module use /g/data/vk83/prerelease/modules;
module load payu/dev
mkdir -p ~/ancoms-roms
cd ~/ancoms-roms/
payu clone -B dev-eac4km_barra-ecmwf https://github.com/ACCESS-Community-Hub/roms-configs.git eac4km_barra-ecmwf
cd eac4km_barra-ecmwf
payu run
```
