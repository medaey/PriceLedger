#!/bin/bash

# Usage :
#   ./run.sh [web|cli] [arguments CLI]
# Exemples :
#   ./run.sh cli -d 01/01/2023 -e BTC
#   ./run.sh web
#   ./run.sh -d 01/01/2023 -e BTC  -> lance CLI par défaut

if [ "$1" == "web" ]; then
    # Vérifie si le script web est exécutable, sinon ajoute la permission
    if [ ! -x web/start-web-server.sh ]; then
        chmod +x web/start-web-server.sh
    fi
    ./web/start-web-server.sh
else
    # Par défaut : CLI
    if [ ! -x cli/crypto_price_checker.sh ]; then
        chmod +x cli/crypto_price_checker.sh
    fi
    ./cli/crypto_price_checker.sh "$@"
fi