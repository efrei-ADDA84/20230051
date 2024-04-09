const express = require('express');
const app = express();
const axios = require('axios').default;

const lat = process.env.LAT;
const lon = process.env.LONG ;
const API_key = "e53b89bf6f72d78026517e7df004ad77";

app.get('/', (req, res) => {
    axios.get(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_key}`)
    .then(response => {
        res.json(response.data);
    })
    .catch(error => {
        console.log(error.message);
        res.status(500).send('Erreur de récupération des données météo');
    });
});

const PORT = 3500;
app.listen(PORT, () => {
    console.log(`Serveur en marche sur le port ${PORT}`);
});
