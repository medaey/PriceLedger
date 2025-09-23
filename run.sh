#!/bin/bash

# Script racine pour lancer la version terminal ou le serveur web
# Usage :
#   ./run.sh web                -> lance le serveur web
#   ./run.sh [arguments CLI]    -> lance la version terminal par défaut
#   ./run.sh -h|--help          -> affiche l’aide

show_help() {
    echo
    echo "📌 Usage : $0 [web|cli] [arguments pour la version terminal]"
    echo
    echo "🌟 Exemples :"
    echo "   $0 web                         -> lance le serveur web"
    echo "   $0 -d 01/01/2023 -e BTC        -> lance la version terminal avec date et crypto"
    echo
    echo "📖 Arguments pour la version terminal :"
    echo "   -d JJ/MM/AAAA  -> Spécifie la date"
    echo "   -e BTC|ETH     -> Choisit la cryptomonnaie"
    echo
    echo "💡 Astuce : si aucun argument n'est fourni, le script affiche ce message d'aide."
    echo
}

# Affiche l'aide si aucun argument ou si -h/--help
if [ $# -eq 0 ] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

if [ "$1" == "web" ]; then
    # Vérifie si le script web est exécutable
    [ ! -x web/start-web-server.sh ] && chmod +x web/start-web-server.sh
    ./web/start-web-server.sh
else
    # Par défaut : version terminal
    [ ! -x cli/crypto_price_checker.sh ] && chmod +x cli/crypto_price_checker.sh
    ./cli/crypto_price_checker.sh "$@"
fi
