// Initialisation : date du jour
window.addEventListener('DOMContentLoaded', () => {
    const today = new Date();
    document.getElementById('date').value =
        today.toISOString().split('T')[0];

    updateCryptoIcon(); // icône au chargement
});

// Icônes par crypto
const cryptoIcons = {
    BTC: '<i class="fa-brands fa-bitcoin"></i>',
    ETH: '<i class="fa-brands fa-ethereum"></i>'
};

// Mise à jour de l’icône
function updateCryptoIcon() {
    const crypto = document.getElementById('crypto').value;
    document.getElementById('cryptoIcon').innerHTML = cryptoIcons[crypto];
}

// Changement de crypto → icône
document.getElementById('crypto').addEventListener('change', updateCryptoIcon);

// Gestion du formulaire
document.getElementById('cryptoForm').addEventListener('submit', (event) => {
    event.preventDefault();

    const dateInput = document.getElementById('date').value;
    const crypto = document.getElementById('crypto').value;
    const resultDiv = document.getElementById('result');

    if (!dateInput) {
        showError("Veuillez sélectionner une date.");
        return;
    }

    const timestamp = Math.floor(new Date(dateInput).getTime() / 1000);

    fetch(`https://min-api.cryptocompare.com/data/pricehistorical?fsym=${crypto}&ts=${timestamp}&tsyms=EUR`)
        .then(response => response.json())
        .then(data => {
            const price = data?.[crypto]?.EUR;

            if (!price) {
                showError(`Aucune donnée trouvée pour ${crypto} à cette date.`);
                return;
            }

            const [year, month, day] = dateInput.split('-');
            const dateFR = `${day}/${month}/${year}`;

            resultDiv.innerText = `Le ${dateFR}\n1 ${crypto} = ${price} €`;
            resultDiv.className = "alert alert-success";
            resultDiv.style.display = "block";
        })
        .catch(() => {
            showError("Erreur lors de la récupération des données.");
        });
});

// Affichage des erreurs
function showError(message) {
    const resultDiv = document.getElementById('result');
    resultDiv.innerText = message;
    resultDiv.className = "alert alert-danger";
    resultDiv.style.display = "block";
}
