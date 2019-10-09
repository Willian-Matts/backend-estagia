const mysql = require('mysql');

var appRouter = function (app) {
    const conEstagia = mysql.createPool({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'estagia',

    });

    app.get("/alunos", (req, res) => {
        conEstagia.getConnection(function (error, conEstagia) {
            conEstagia.query('SELECT * FROM alunos_cadastrados;', function (error, results, fields) {
                res.send(results);
            });
            conEstagia.end();
        });
    });

    app.get('/aluno/:id?', (req, res) => {
        conEstagia.getConnection(function (error, conEstagia) {
            conEstagia.query('SELECT * FROM alunos_cadastrados where idaluno = ' + parseInt(req.params.id), function(error, results, fields){
                res.send(results)
            });
        });
    });
}
module.exports = appRouter;
