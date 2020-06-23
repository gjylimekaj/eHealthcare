const express = require('express');
const bodyParser = require("body-parser");
const hbs = require("hbs");
const path = require("path");
const router = require("./config/router");

const app = express();

// Set View file
app.set("views", "views");

// Set View Engine
app.set("view engine", "hbs");
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

app.use('/', router);

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => console.log(`Server running on port ${PORT}...`));