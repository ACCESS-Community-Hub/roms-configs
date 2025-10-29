#!/bin/bash

# Script to replace ININAME value with RSTNAME value in roms.in file
# Usage: ./set_ininame_as_rstname.sh [path_to_roms.in]

## get the roms.in file path (default to current directory if not provided)
ROMS_FILE="${1:-roms.in}"

## check if the file exists
if [ ! -f "$ROMS_FILE" ]; then
    echo "Error: File '$ROMS_FILE' not found."
    exit 1
fi

## extract the RSTNAME and ININAME value
RSTNAME=$(sed -n 's/^\s*RSTNAME\s*==\s*//p' "$ROMS_FILE" | tr -d ' ')
ININAME=$(sed -n 's/^\s*ININAME\s*==\s*//p' "$ROMS_FILE" | tr -d ' ')

## check if ININAME has already been replaced with RSTNAME
if [ "$ININAME" = "$RSTNAME" ]; then
    echo "ININAME already equals RSTNAME. No changes needed."
    exit 0
fi

## replace ININAME value with RSTNAME value
sed -i "s/^\( *ININAME *== *\).*/\1$RSTNAME/" "$ROMS_FILE"
echo "Replaced ININAME with: $RSTNAME"