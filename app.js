const express = require('express');
const bodyParser = require("body-parser");
const router = require("./src/router");
const models = require('./models');
const Op = models.Sequelize.Op;
const db = require('./models');
const Vendor = require('./models/vendor')

const app = express();

app.use(express.static(__dirname + '/public'));

// Set View file
app.set("views", "views");

// Set View Engine
app.set("view engine", "hbs");
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

app.use('/', router);

const PORT = process.env.PORT || 5000;

db.sequelize.sync().then(
    () => {
        app.listen(PORT, () => console.log(`Server running on port ${PORT}...`));
    }
);
