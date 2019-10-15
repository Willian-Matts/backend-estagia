const mysql = require('mysql');

var appRouter = function (app) {
    const conEstagia = mysql.createPool({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'estagia',

    });
    app.get("/estagios", (req, res) => {
        let sql = 'SELECT * FROM estagio_view order by nome_aluno;';
        conEstagia.getConnection(function (error, conEstagia) {
            conEstagia.query(sql, function (error, results, fields) {
                res.send(results);
            });
            conEstagia.release();
        });
    });

    app.delete('/deleteEstagio/:id', (req, res) => {
        let sql = 'DELETE FROM estagio WHERE idsupervisor =';
        conEstagia.getConnection(function (err, conEstagia) {
            conEstagia.query(sql + parseInt(req.params.id), (error, results, fields) => {
                if (error)
                    return console.error(error.message);
                console.log('Deleted Row(s):', results.affectedRows);
            });
            conEstagia.release();
        });
    });

    app.post('/inserirEstagio', function (req, res) {
        var nome = req.body.nome_supervisor;
        var CPF = req.body.CPF_supervisor;
        var formacao = req.body.formacao_supervisor;
        var data_nascimento = req.body.data_nascimento_supervisor;
        var email = req.body.email_supervisor;
        var telefone = req.body.telefone_supervisor;

        let sql = `INSERT INTO estagio (nome_supervisor, email_supervisor, telefone_supervisor, CPF_supervisor , formacao_supervisor, data_nascimento_supervisor, idempresa_FK) VALUES ('${nome}', '${email}', '${telefone}', '${CPF}', '${formacao}', '${data_nascimento}', '4')`;
        conEstagia.getConnection(function (err, conEstagia) {
            conEstagia.query(sql, function (err, result) {
                if (err) throw err;
                console.log("1 record inserted");
            });
            conEstagia.release();
        });
    });

    app.put('/editarEstagio/:id', function (req, res) {
        var id = parseInt(req.params.id);
        var nome = req.body.nome_supervisor;
        var CPF = req.body.CPF_supervisor;
        var formacao = req.body.formacao_supervisor;
        var data_nascimento = req.body.data_nascimento_supervisor;
        var email = req.body.email_supervisor;
        var telefone = req.body.telefone_supervisor;

        let sql = `UPDATE estagio SET nome_supervisor = '${nome}', email_supervisor = '${email}', telefone_supervisor = '${telefone}', CPF_supervisor = '${CPF}', formacao_supervisor = '${formacao}', data_nascimento_supervisor = '${data_nascimento}' WHERE idsupervisor = ` + id;
        conEstagia.getConnection(function (err, conEstagia) {
            conEstagia.query(sql, function (err, result) {
            });
            conEstagia.release();
        });

    });

    // ----------------------------------------------------------------------------------

    app.get("/supervisores", (req, res) => {
        let sql = 'SELECT * FROM supervisor_view order by nome_supervisor;';
        conEstagia.getConnection(function (error, conEstagia) {
            conEstagia.query(sql, function (error, results, fields) {
                res.send(results);
            });
            conEstagia.release();
        });
    });

    app.delete('/deleteSupervisor/:id', (req, res) => {
        let sql = 'DELETE FROM supervisor WHERE idsupervisor =';
        conEstagia.getConnection(function (err, conEstagia) {
            conEstagia.query(sql + parseInt(req.params.id), (error, results, fields) => {
                if (error)
                    return console.error(error.message);
                console.log('Deleted Row(s):', results.affectedRows);
            });
            conEstagia.release();
        });
    });

    app.post('/inserirSupervisor', function (req, res) {
        var nome = req.body.nome_supervisor;
        var CPF = req.body.CPF_supervisor;
        var formacao = req.body.formacao_supervisor;
        var data_nascimento = req.body.data_nascimento_supervisor;
        var email = req.body.email_supervisor;
        var telefone = req.body.telefone_supervisor;

        let sql = `INSERT INTO supervisor (nome_supervisor, email_supervisor, telefone_supervisor, CPF_supervisor , formacao_supervisor, data_nascimento_supervisor, idempresa_FK) VALUES ('${nome}', '${email}', '${telefone}', '${CPF}', '${formacao}', '${data_nascimento}', '4')`;
        conEstagia.getConnection(function (err, conEstagia) {
            conEstagia.query(sql, function (err, result) {
                if (err) throw err;
                console.log("1 record inserted");
            });
            conEstagia.release();
        });
    });

    app.put('/editarSupervisor/:id', function (req, res) {
        var id = parseInt(req.params.id);
        var nome = req.body.nome_supervisor;
        var CPF = req.body.CPF_supervisor;
        var formacao = req.body.formacao_supervisor;
        var data_nascimento = req.body.data_nascimento_supervisor;
        var email = req.body.email_supervisor;
        var telefone = req.body.telefone_supervisor;

        let sql = `UPDATE supervisor SET nome_supervisor = '${nome}', email_supervisor = '${email}', telefone_supervisor = '${telefone}', CPF_supervisor = '${CPF}', formacao_supervisor = '${formacao}', data_nascimento_supervisor = '${data_nascimento}' WHERE idsupervisor = ` + id;
        conEstagia.getConnection(function (err, conEstagia) {
            conEstagia.query(sql, function (err, result) {
            });
            conEstagia.release();
        });

    });

    // ----------------------------------------------------------------------------------

    app.get("/empresas", (req, res) => {
        let sql = 'SELECT * FROM empresa_view order by nome_empresa;';
        conEstagia.getConnection(function (error, conEstagia) {
            conEstagia.query(sql, function (error, results, fields) {
                res.send(results);
            });
            conEstagia.release();
        });
    });

    app.delete('/deleteEmpresa/:id', (req, res) => {
        let sql = 'DELETE FROM empresa WHERE idempresa =';
        conEstagia.getConnection(function (err, conEstagia) {
            conEstagia.query(sql + parseInt(req.params.id), (error, results, fields) => {
                if (error)
                    return console.error(error.message);
                console.log('Deleted Row(s):', results.affectedRows);
            });
            conEstagia.release();
        });
    });

    app.post('/inserirEmpresa', function (req, res) {
        var nome = req.body.nome_empresa;
        var CNPJ = req.body.CNPJ;
        var endereco = req.body.endereco_empresa;
        var bairro = req.body.bairro_empresa;
        var email = req.body.email_empresa;
        var telefone = req.body.telefone_empresa;

        let sql = `INSERT INTO empresa (nome_empresa, email_empresa, endereco_empresa, telefone_empresa, CNPJ, bairro_empresa, idcidade_FK) VALUES ('${nome}', '${email}', '${endereco}', '${telefone}', '${CNPJ}', '${bairro}', '1')`;
        conEstagia.getConnection(function (err, conEstagia) {
            conEstagia.query(sql, function (err, result) {
                if (err) throw err;
                console.log("1 record inserted");
            });
            conEstagia.release();
        });
    });

    app.put('/editarEmpresa/:id', function (req, res) {
        var id = parseInt(req.params.id);
        var nome = req.body.nome_empresa;
        var CNPJ = req.body.CNPJ;
        var endereco = req.body.endereco_empresa;
        var bairro = req.body.bairro_empresa;
        var email = req.body.email_empresa;
        var telefone = req.body.telefone_empresa;

        let sql = `UPDATE empresa SET nome_empresa = '${nome}', email_empresa = '${email}', endereco_empresa = '${endereco}', telefone_empresa = '${telefone}', CNPJ = '${CNPJ}', bairro_empresa = '${bairro}' WHERE idempresa = ` + id;
        conEstagia.getConnection(function (err, conEstagia) {
            conEstagia.query(sql, function (err, result) {
            });
            conEstagia.release();
        });

    });

    // ----------------------------------------------------------------------------------

    app.get("/alunos", (req, res) => {
        let sql = 'SELECT * FROM aluno_view order by nome_aluno;';
        conEstagia.getConnection(function (error, conEstagia) {
            conEstagia.query(sql, function (error, results, fields) {
                res.send(results);
            });
            conEstagia.release();
        });
    });

    app.delete('/deleteAluno/:id', (req, res) => {
        let sql = 'DELETE FROM aluno WHERE idaluno =';
        conEstagia.getConnection(function (err, conEstagia) {
            conEstagia.query(sql + parseInt(req.params.id), (error, results, fields) => {
                if (error)
                    return console.error(error.message);
                console.log('Deleted Row(s):', results.affectedRows);
            });
            conEstagia.release();
        });
    });

    app.post('/inserirAluno', function (req, res) {
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

        let sql = `INSERT INTO aluno (nome_aluno, email_aluno, endereco_aluno, telefone_aluno, data_nascimento_aluno, CPF_aluno, bairro_aluno, matricula_aluno, periodo_aluno, nome_orientador_aluno, idcidade_FK) VALUES ('${nome}', '${email}', '${endereco}', '${telefone}', '${data_nascimento}', '${CPF}', '${bairro}', '${matricula}', '${periodo}', '${nome_orientador}', '1')`;
        conEstagia.getConnection(function (err, conEstagia) {
            conEstagia.query(sql, function (err, result) {
                if (err) throw err;
                console.log("1 record inserted");
            });
            conEstagia.release();
        });
    });

    app.put('/editarAluno/:id', function (req, res) {
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

        let sql = `UPDATE aluno SET nome_aluno = '${nome}', email_aluno = '${email}', endereco_aluno = '${endereco}', telefone_aluno = '${telefone}', data_nascimento_aluno = '${data_nascimento}', CPF_aluno = '${CPF}', bairro_aluno = '${bairro}', matricula_aluno = '${matricula}', periodo_aluno = '${periodo}', nome_orientador_aluno = '${nome_orientador}' WHERE idaluno = ` + id;
        conEstagia.getConnection(function (err, conEstagia) {
            conEstagia.query(sql, function (err, result) {
            });
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
