document.getElementById('cryptoForm').addEventListener('submit', function(event) {
    event.preventDefault();
    
    const dateInput = document.getElementById('date').value;
    const crypto = document.getElementById('crypto').value;
    
    const formattedDate = new Date(dateInput.split('/').reverse().join('-')).getTime() / 1000; // timestamp

    fetch(`https://min-api.cryptocompare.com/data/pricehistorical?fsym=${crypto}&ts=${formattedDate}&tsyms=EUR`)
        .then(response => response.json())
        .then(data => {
            const price = data[crypto].EUR;
            const resultDiv = document.getElementById('result');
            if (price) {
                resultDiv.innerText = `Le ${dateInput}\n1 ${crypto} = ${price} €`;
                resultDiv.classList.remove('alert-info');
                resultDiv.classList.add('alert-success');
                resultDiv.style.display = 'block';
            } else {
                resultDiv.innerText = `Aucune donnée trouvée pour ${crypto} à cette date.`;
                resultDiv.classList.remove('alert-info');
                resultDiv.classList.add('alert-danger');
                resultDiv.style.display = 'block';
            }
        })
        .catch(error => {
            console.error('Erreur:', error);
            const resultDiv = document.getElementById('result');
            resultDiv.innerText = "Erreur lors de la récupération des données.";
            resultDiv.classList.remove('alert-info');
            resultDiv.classList.add('alert-danger');
            resultDiv.style.display = 'block';
        });
});
