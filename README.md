Parfait ! Voici le **README réorganisé** avec `start-web-server.sh` dans le dossier `web/` et le CLI séparé proprement. Tout est prêt pour GitHub :

---

# PriceLedger 🚀

![Capture de l'interface web](images/web_preview.png)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Python](https://img.shields.io/badge/Python-3.x-blue)](https://www.python.org/)
[![Bash](https://img.shields.io/badge/Bash-CLI-green)](https://www.gnu.org/software/bash/)

**PriceLedger** permet de consulter le prix historique du **Bitcoin (BTC)** ou de **l’Ethereum (ETH)** à une date donnée.
Deux modes d’utilisation : **CLI Bash** ou **interface web**.

---

## 🔹 Fonctionnalités

* Vérification des prix historiques BTC/ETH à une date précise
* Conversion automatique des dates en **timestamp Unix** pour l’API CryptoCompare
* Retour d’erreur clair si aucune donnée n’est trouvée
* Deux interfaces disponibles :

| Mode    | Description        | Avantages                                      |
| ------- | ------------------ | ---------------------------------------------- |
| **CLI** | Interface terminal | Rapide, léger, idéal pour les utilisateurs CLI |
| **Web** | Interface HTML/JS  | Ergonomique, interactive, visuelle             |

---

## 🗂 Structure du projet

```
PriceLedger/
├── cli/
│   └── crypto_price_checker.sh    # CLI pour consulter les prix
├── web/
│   ├── index.html                 # Page web principale
│   ├── script.js                  # JavaScript pour interroger l’API
│   └── start-web-server.sh        # CLI pour lancer le serveur web
├── images/                        # Dossier pour images (ex: web_preview.png)
├── README.md                      # Documentation
└── LICENSE                        # License du projet
```

> Tout ce qui concerne l’interface web est regroupé dans `web/`, et le CLI est dans `cli/`.

---

## ⚙️ Prérequis

* **Python 3** (pour le serveur web local)
* **curl** et **jq** (pour le CLI Bash)
* Navigateur web moderne (pour l’interface web)

---

## 🚀 Installation et utilisation

### Via le CLI Bash

1. Rendre le CLI exécutable :

```bash
chmod +x cli/crypto_price_checker.sh
```

2. Lancer le CLI :

```bash
./cli/crypto_price_checker.sh -d 01/01/2023 -e BTC
```

3. Suivre les instructions pour entrer la date et choisir la cryptomonnaie.

**Arguments optionnels :**

* `-d JJ/MM/AAAA` → Spécifier la date
* `-e BTC|ETH` → Choisir la cryptomonnaie

---

### Via l’interface web

1. Rendre le serveur web exécutable :

```bash
chmod +x web/start-web-server.sh
```

2. Lancer le serveur web :

```bash
./web/start-web-server.sh
```

3. Ouvrir le navigateur à l’adresse :

```
http://localhost:8000
```

4. Entrer la date, sélectionner la cryptomonnaie et cliquer sur **Obtenir le prix**.

---

## 🔗 API utilisée

* [CryptoCompare API](https://www.cryptocompare.com/)

---

## 📌 Notes importantes

* Format de date : **JJ/MM/AAAA**
* Le serveur web est nécessaire pour éviter les problèmes de **CORS**
* Si aucune donnée n’est disponible, un message d’erreur s’affiche

---

## 📝 License

MIT License © 2025 Médéric Cossu
Le logiciel est fourni "tel quel", sans aucune garantie. Voir `LICENSE` pour plus de détails.

---