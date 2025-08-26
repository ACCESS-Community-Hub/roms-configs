
## Run ROMS [Upwelling test-case](https://www.myroms.org/wiki/UPWELLING_CASE)

### Get ANCOMS-ROMS Upwelling configuration

```bash
mkdir -p ~/ancoms-roms
cd ~/ancoms-roms/
payu clone -B release-upwelling+testcase https://github.com/ACCESS-Community-Hub/roms-configs.git upwelling+testcase
cd upwelling+testcase
```

### Run configuration
```bash
payu run
```

See [README](https://github.com/ACCESS-Community-Hub/roms-configs/blob/main/README.md) for further instructions.