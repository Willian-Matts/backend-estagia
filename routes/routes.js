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
            conEstagia.release();
        });
    });

    app.delete('/delete/:id', (req, res) => {
        conEstagia.getConnection(function (err, conEstagia) {
            conEstagia.query('DELETE FROM aluno WHERE idaluno =' + parseInt(req.params.id), (error, results, fields) => {
                if (error)
                    return console.error(error.message);
                console.log('Deleted Row(s):', results.affectedRows);
            });
            res.sendStatus(200);
            conEstagia.release();
        });
    });

    app.post('/inserir', function (req, res) {
        var nome = req.body.nome_aluno;
        var CPF = req.body.CPF_aluno;
        var data_nascimento = req.body.data_nascimento_aluno;
        var endereco = req.body.endereco_aluno;
        var bairro = req.body.bairro_aluno;
        var nome_orientador = req.body.nome_orientador_aluno;
        var email = req.body.email_aluno;
        var telefone = req.body.telefone_aluno;
        var periodo = req.body.periodo_aluno;
        var matricula = req.body.matricula_aluno;
        conEstagia.getConnection(function (err, conEstagia) {
            conEstagia.query("INSERT INTO atividade (nome_atividade, descricao_atividade, data_atividade, carga_horaria_atividade, id_estagio) VALUES ('" + nome + "', '" + descricao + "', '" + data + "', '" + cargaHoraria + "', 1)", function (err, result) {
                if (err) throw err;
                console.log("1 record inserted");
            });
            res.sendStatus(200);
            conEstagia.release();
        });
    });

    app.put('/editar/:id', function (req, res) {
        var id = parseInt(req.params.id);
        var nome = req.body.nome_aluno;
        var CPF = req.body.CPF_aluno;
        var data_nascimento = req.body.data_nascimento_aluno;
        var endereco = req.body.endereco_aluno;
        var bairro = req.body.bairro_aluno;
        var nome_orientador = req.body.nome_orientador_aluno;
        var email = req.body.email_aluno;
        var telefone = req.body.telefone_aluno;
        var periodo = req.body.periodo_aluno;
        var matricula = req.body.matricula_aluno;
        
        data_nascimento = data_nascimento.split("-");
        data_nascimento = data_nascimento.join("-");

        console.log(data_nascimento);

        
        let sql = `UPDATE aluno SET nome_aluno = '${nome}', email_aluno = '${email}', endereco_aluno = '${endereco}', telefone_aluno = '${telefone}', data_nascimento_aluno = '${data_nascimento}', CPF_aluno = '${CPF}', bairro_aluno = '${bairro}', matricula_aluno = '${matricula}', periodo_aluno = '${periodo}', nome_orientador_aluno = '${nome_orientador}' WHERE idaluno = ` + id;
        conEstagia.getConnection(function (err, conEstagia) {
            conEstagia.query(sql, function (err, result) {
            });
            res.sendStatus(200);
            conEstagia.release();
        });

    });

    app.get('/aluno/:id?', (req, res) => {
        conEstagia.getConnection(function (error, conEstagia) {
            conEstagia.query('SELECT * FROM aluno where idaluno = ' + parseInt(req.params.id), function (error, results, fields) {
                res.send(results)
            });
        });
        conEstagia.release();
    });
}
module.exports = appRouter;
