#!/bin/bash

GRUPID=$(./crearGrup.sh)

# Crear Windows Server
./crearWS.sh "$GRUPID"

# Crear Linux Server
./crearLS.sh "$GRUPID"
