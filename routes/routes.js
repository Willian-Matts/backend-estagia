const mysql = require('mysql');
const session = require('express-session');
const express = require('express');
const app = express();
app.use(session({ secret: 'teste' }));

var appRouter = function (app) {
    const conEstagia = mysql.createPool({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'estagia',

    });

    app.get('/', function (req, res) {

        // Check if an e-mail address is set in the session.
        // If it is, we will redirect to the admin page.

        if (req.session.email) {
            res.send('/main/alunos');
        }
        else {
            res.send('/');
        }
    });

    app.post('/login', function (req, res) {

        // Very basic. Set the session e-mail to whatever the user has added.
        if (req.body.login && req.body.senha) {
            req.session.login = req.body.login;
            req.session.senha = req.body.senha;

            console.log("logou");
            
            res.send(req.session.auth = true);
            console.log(req.session.auth);
        } else {
            console.log("Sem dados");
            res.send(req.session.auth);
        }

    });


    app.get('/logout', function (req, res) {

        // if the user logs out, destroy all of their individual session
        // information
        console.log(req.session.login);
        req.session.destroy(function (err) {
            if (err) {
                console.log(err);
            } else {
                res.redirect('/');
            }
        });
    });



    // ----------------------------------------------------------------------------------
    app.post("/buscarEstagio", (req, res) => {

        var nomeEmpresa = req.body.nome_empresa;
        var dataInicio = req.body.data_inicio;
        var dataFinal = req.body.data_final;
        console.log(nomeEmpresa);
        console.log(dataInicio);
        console.log(dataFinal);

        if(nomeEmpresa === "" && dataInicio === ""){
            var sql = `select nome_aluno, nome_empresa, data_inicio_estagio, data_final_estagio, horas_totais_estagio 
            from estagio e inner join aluno a
            on e.idaluno_FK = a.idaluno
            and e.data_final_estagio like '%${dataFinal}%' 
            inner join empresa em 
            on e.idempresa_FK = em.idempresa`;

        }else if(nomeEmpresa === "" && dataFinal === ""){
            var sql = `select nome_aluno, nome_empresa, data_inicio_estagio, data_final_estagio, horas_totais_estagio 
            from estagio e inner join aluno a
            on e.idaluno_FK = a.idaluno 
            and e.data_inicio_estagio like '%${dataInicio}%' 
            inner join empresa em 
            on e.idempresa_FK = em.idempresa`;

        }else if(dataFinal === "" && dataInicio === ""){
            var sql = `select nome_aluno, nome_empresa, data_inicio_estagio, data_final_estagio, horas_totais_estagio 
            from estagio e inner join aluno a
            on e.idaluno_FK = a.idaluno 
            inner join empresa em 
            on e.idempresa_FK = em.idempresa
            and em.nome_empresa like '%${nomeEmpresa}%'`;

        }else if(nomeEmpresa === ""){
            var sql = `select nome_aluno, nome_empresa, data_inicio_estagio, data_final_estagio, horas_totais_estagio 
            from estagio e inner join aluno a
            on e.idaluno_FK = a.idaluno 
            and e.data_inicio_estagio like '%${dataInicio}%'
            and e.data_final_estagio like '%${dataFinal}%' 
            inner join empresa em 
            on e.idempresa_FK = em.idempresa`;
        
        }else if(dataInicio === ""){
            var sql = `select nome_aluno, nome_empresa, data_inicio_estagio, data_final_estagio, horas_totais_estagio 
            from estagio e inner join aluno a
            on e.idaluno_FK = a.idaluno 
            and e.data_final_estagio like '%${dataFinal}%' 
            inner join empresa em 
            on e.idempresa_FK = em.idempresa
            and em.nome_empresa like '%${nomeEmpresa}%'`;

        }else if(dataFinal === ""){
            var sql = `select nome_aluno, nome_empresa, data_inicio_estagio, data_final_estagio, horas_totais_estagio 
            from estagio e inner join aluno a
            on e.idaluno_FK = a.idaluno 
            and e.data_inicio_estagio like '%${dataInicio}%'
            inner join empresa em 
            on e.idempresa_FK = em.idempresa
            and em.nome_empresa like '%${nomeEmpresa}%'`;
        }else{
            var sql = `select nome_aluno, nome_empresa, data_inicio_estagio, data_final_estagio, horas_totais_estagio 
            from estagio e inner join aluno a
            on e.idaluno_FK = a.idaluno 
            and e.data_inicio_estagio = '%${dataInicio}%'
            and e.data_final_estagio = '%${dataFinal}%' 
            inner join empresa em 
            on e.idempresa_FK = em.idempresa
            and em.nome_empresa like '%${nomeEmpresa}%'`;
        }

        conEstagia.getConnection(function (error, conEstagia) {
            conEstagia.query(sql, function (error, results, fields) {
                res.send(results);
            });
            conEstagia.release();
        });
    });

    app.post("/funcionario", (req, res) => {

        var email = req.body.login;
        var senha = req.body.senha;

        let sql = `SELECT * FROM estagia.funcionario where email_funcionario = '${email}' and senha_funcionario = '${senha}'`;
        conEstagia.getConnection(function (error, conEstagia) {
            conEstagia.query(sql, function (error, results, fields) {
                res.send(results);
            });
            conEstagia.release();
        });
    });

    app.get("/cidades", (req, res) => {
        let sql = 'SELECT * FROM cidade order by nome_cidade;';
        conEstagia.getConnection(function (error, conEstagia) {
            conEstagia.query(sql, function (error, results, fields) {
                res.send(results);
            });
            conEstagia.release();
        });
    });

    // ----------------------------------------------------------------------------------

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
        let sql = 'DELETE FROM estagio WHERE idestagio =';
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
        var setor = req.body.setor_estagio;
        var data_inicio = req.body.data_inicio_estagio;
        var data_final = req.body.data_final_estagio;
        var horas_diarias = req.body.horas_diarias_estagio;
        var horas_semanais = req.body.horas_semanais_estagio;
        var horas_totais = req.body.horas_totais_estagio;
        var aluno = req.body.aluno_estagio;
        var empresa = req.body.empresa_estagio;
        var supervisor = req.body.supervisor_estagio;

        let sql = `INSERT INTO estagio (setor_estagio, data_inicio_estagio, data_final_estagio, horas_diarias_estagio, horas_semanais_estagio, horas_totais_estagio , idaluno_FK, idempresa_FK, idsupervisor_FK) VALUES ('${setor}', '${data_inicio}', '${data_final}', '${horas_diarias}', '${horas_semanais}', '${horas_totais}', '${aluno}', '${empresa}', '${supervisor}')`;
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
        var setor = req.body.setor_estagio;
        var data_inicio = req.body.data_inicio_estagio;
        var data_final = req.body.data_final_estagio;
        var horas_diarias = req.body.horas_diarias_estagio;
        var horas_semanais = req.body.horas_semanais_estagio;
        var horas_totais = req.body.horas_totais_estagio;
        var aluno = req.body.aluno_estagio;
        var empresa = req.body.empresa_estagio;
        var supervisor = req.body.supervisor_estagio;

        // let sql = `UPDATE aluno SET nome_aluno = '${nome}', email_aluno = '${email}', endereco_aluno = '${endereco}', telefone_aluno = '${telefone}', data_nascimento_aluno = '${data_nascimento}', CPF_aluno = '${CPF}', bairro_aluno = '${bairro}', matricula_aluno = '${matricula}', periodo_aluno = '${periodo}', nome_orientador_aluno = '${nome_orientador}', idcidade_FK = '${cidade}' WHERE idaluno = ` + id;


        let sql = `UPDATE estagio SET setor_estagio = '${setor}', data_inicio_estagio = '${data_inicio}', data_final_estagio = '${data_final}', horas_diarias_estagio = '${horas_diarias}', horas_semanais_estagio = '${horas_semanais}', horas_totais_estagio = '${horas_totais}', idaluno_FK = '${aluno}', idempresa_FK = '${empresa}', idsupervisor_FK = '${supervisor}'  WHERE idestagio = ` + id;
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
        var empresa = req.body.empresa_supervisor;

        let sql = `INSERT INTO supervisor (nome_supervisor, email_supervisor, telefone_supervisor, CPF_supervisor , formacao_supervisor, data_nascimento_supervisor, idempresa_FK) VALUES ('${nome}', '${email}', '${telefone}', '${CPF}', '${formacao}', '${data_nascimento}', '${empresa}')`;
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
        var empresa = req.body.empresa_supervisor;

        let sql = `UPDATE supervisor SET nome_supervisor = '${nome}', email_supervisor = '${email}', telefone_supervisor = '${telefone}', CPF_supervisor = '${CPF}', formacao_supervisor = '${formacao}', data_nascimento_supervisor = '${data_nascimento}', idempresa_FK = '${empresa}' WHERE idsupervisor = ` + id;
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
        var cidade = req.body.cidade_empresa;

        let sql = `INSERT INTO empresa (nome_empresa, email_empresa, endereco_empresa, telefone_empresa, CNPJ, bairro_empresa, idcidade_FK) VALUES ('${nome}', '${email}', '${endereco}', '${telefone}', '${CNPJ}', '${bairro}', '${cidade}')`;
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
        var cidade = req.body.cidade_empresa;

        let sql = `UPDATE empresa SET nome_empresa = '${nome}', email_empresa = '${email}', endereco_empresa = '${endereco}', telefone_empresa = '${telefone}', CNPJ = '${CNPJ}', bairro_empresa = '${bairro}', idcidade_FK = '${cidade}' WHERE idempresa = ` + id;
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
        var cidade = req.body.cidade_aluno;

        console.log(cidade);

        let sql = `INSERT INTO aluno (nome_aluno, email_aluno, endereco_aluno, telefone_aluno, data_nascimento_aluno, CPF_aluno, bairro_aluno, matricula_aluno, periodo_aluno, nome_orientador_aluno, idcidade_FK) VALUES ('${nome}', '${email}', '${endereco}', '${telefone}', '${data_nascimento}', '${CPF}', '${bairro}', '${matricula}', '${periodo}', '${nome_orientador}', '${cidade}')`;
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
        var cidade = req.body.cidade_aluno;

        let sql = `UPDATE aluno SET nome_aluno = '${nome}', email_aluno = '${email}', endereco_aluno = '${endereco}', telefone_aluno = '${telefone}', data_nascimento_aluno = '${data_nascimento}', CPF_aluno = '${CPF}', bairro_aluno = '${bairro}', matricula_aluno = '${matricula}', periodo_aluno = '${periodo}', nome_orientador_aluno = '${nome_orientador}', idcidade_FK = '${cidade}' WHERE idaluno = ` + id;
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
