Parfait ! On peut **modifier ton README** pour intégrer le nouveau `run.sh` racine avec CLI implicite et arguments, et simplifier les instructions pour le web et le CLI. Voici une version finale adaptée :

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
├── cli/                             # Dossier contenant la version en terminal Bash
│   └── crypto_price_checker.sh      # CLI pour consulter le prix historique des cryptomonnaies
├── images/                          # Dossier pour les images du projet
│   └── web_preview.png              # Capture d’écran de l’interface web pour le README
├── LICENSE                          # Fichier de licence MIT
├── README.md                        # Documentation du projet
├── run.sh                           # Script racine pour lancer le CLI ou le serveur web
└── web/                             # Dossier contenant l’interface web
    ├── index.html                   # Page HTML principale de l’interface web
    ├── script.js                    # JavaScript pour interroger l’API et gérer l’interface web
    └── start-web-server.sh          # Script pour démarrer le serveur web local
```

> Le script `run.sh` à la racine permet de lancer **le CLI (par défaut) ou le serveur web** de manière simple.

---

## ⚙️ Prérequis

* **Python 3** (pour le serveur web local)
* **curl** et **jq** (pour le CLI Bash)
* Navigateur web moderne (pour l’interface web)

---

## 🚀 Installation et utilisation

### Utilisation via `run.sh` (recommandé)

* **Lancer le CLI par défaut** :

```bash
./run.sh -d 01/01/2023 -e BTC
```

* **Lancer le serveur web** :

```bash
./run.sh web
```

> Le CLI accepte tous ses arguments habituels : `-d JJ/MM/AAAA` et `-e BTC|ETH`.

---

### Optionnel : lancer directement les scripts

#### CLI Bash

```bash
chmod +x cli/crypto_price_checker.sh
./cli/crypto_price_checker.sh -d 01/01/2023 -e BTC
```

#### Serveur web

```bash
chmod +x web/start-web-server.sh
./web/start-web-server.sh
```

Puis ouvrir le navigateur à l’adresse :

```
http://localhost:8000
```

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