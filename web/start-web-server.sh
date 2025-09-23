#!/bin/bash

# run.sh : Lancer un serveur local pour crypto_price_checker avec vérification des prérequis

PORT=8000

# Fonction pour vérifier si une commande existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Vérification de Python
if command_exists python3; then
    PYTHON_CMD="python3"
elif command_exists python; then
    PYTHON_CMD="python"
else
    echo "❌ Python n'est pas installé. Veuillez installer Python 3 pour continuer."
    exit 1
fi

echo "✅ Python trouvé : $PYTHON_CMD"
echo "🚀 Démarrage du serveur local sur http://localhost:$PORT ..."
echo "Appuyez sur Ctrl+C pour arrêter."

# Lancer le serveur HTTP
$PYTHON_CMD -m http.server $PORT
