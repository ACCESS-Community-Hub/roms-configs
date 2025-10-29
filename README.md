
## Run ROMS [Upwelling test-case](https://www.myroms.org/wiki/UPWELLING_CASE)

### Get ANCOMS-ROMS Upwelling configuration

```bash
module use /g/data/vk83/prerelease/modules;
module load payu/dev
mkdir -p ~/ancoms-roms
cd ~/ancoms-roms/
payu clone -B release-upwelling+testcase https://github.com/ACCESS-Community-Hub/roms-configs.git upwelling+testcase
cd upwelling+testcase
payu run
```

### Run configuration
```bash
payu run
```

See [README](https://github.com/ACCESS-Community-Hub/roms-configs/blob/main/README.md) for further instructions.
