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
            conEstagia.query('SELECT * FROM aluno;', function (error, results, fields) {
                res.send(results);
            });
            conEstagia.end();
        });
    });

    app.delete('/delete/:id', (req, res) => {
        conEstagia.getConnection(function (error, conEstagia) {
            conEstagia.query('DELETE FROM aluno WHERE idaluno=' + parseInt(req.params.id), function (error, results, fields) {
            });
            conEstagia.end();
        });
    });

    app.get('/aluno/:id?', (req, res) => {
        conEstagia.getConnection(function (error, conEstagia) {
            conEstagia.query('SELECT * FROM aluno where idaluno = ' + parseInt(req.params.id), function(error, results, fields){
                res.send(results)
            });
        });
    });
}
module.exports = appRouter;
