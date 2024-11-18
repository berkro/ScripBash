#!/bin/bash

GRUPID= ./crearGrup.sh
echo "$GRUPID"
# Crear Windows Server
./crearWS.sh "$GRUPID"

# Crear Linux Server
./crearLS.sh "$GRUPID"
