const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const routes = require("./routes/routes.js")
const porta = 3001;
const session = require('express-session');

//app.set('views', __dirname + '/views');
//app.engine('html', require('ejs').renderFile);

app.use(session({ secret: 'estagia' }));

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


routes(app);

var server = app.listen(porta, function () {
    console.log("Aplicativo esta rodando na porta", server.address().port);
})

