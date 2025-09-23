#!/bin/bash

# Fonction pour sélectionner la cryptomonnaie
select_crypto() {
    if [ -z "$Crypto_Money" ]; then
        echo "Choisissez la cryptomonnaie :"
        echo "1) BTC"
        echo "2) ETH"
        read -p "Entrez le numéro de votre choix : " choice
        case $choice in
            1) Crypto_Money="BTC" ;;
            2) Crypto_Money="ETH" ;;
            *) echo "Choix invalide !" ; exit 1 ;;
        esac
    fi
}

# Fonction pour convertir une date (JJ/MM/AAAA) en timestamp
convert_date_to_timestamp() {
    local formatted_date=$(echo "$1" | awk -F/ '{print $3 "-" $2 "-" $1}')
    date -d "$formatted_date" +%s 2>/dev/null
}

# Fonction pour récupérer le prix d'une cryptomonnaie
get_crypto_price() {
    local API_URL="https://min-api.cryptocompare.com/data/pricehistorical?fsym=$1&ts=$2&tsyms=EUR"
    curl -s "$API_URL" | jq -r '.[].EUR'
}

# Initialisation des variables
input_date=""
Crypto_Money=""

# Gestion des arguments
while getopts "d:e:" opt; do
    case $opt in
        d) input_date="$OPTARG" ;;
        e) Crypto_Money="$OPTARG" ;;
        *) echo "Option invalide." ; exit 1 ;;
    esac
done

# Demander la date si non fournie
if [ -z "$input_date" ]; then
    read -p "Entrez la date (JJ/MM/AAAA) : " input_date
    if [ -z "$input_date" ]; then
        echo "Aucune date fournie !" 
        exit 1
    fi
fi

# Demander la cryptomonnaie si non fournie
if [ -z "$Crypto_Money" ]; then
    select_crypto
fi

# Convertir la date en timestamp
ts=$(convert_date_to_timestamp "$input_date")
if [ -z "$ts" ]; then
    echo "Date invalide !"
    exit 1
fi

# Récupérer le prix
price=$(get_crypto_price "$Crypto_Money" "$ts")

# Afficher le résultat
if [ "$price" != "null" ] && [ -n "$price" ]; then
    echo "Le $input_date : 1 $Crypto_Money = $price €"
else
    echo "Aucune donnée trouvée pour $Crypto_Money à cette date."
fi
