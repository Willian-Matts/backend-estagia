use estagia;

select nome_aluno, nome_empresa, data_inicio_estagio, data_final_estagio, horas_totais_estagio, setor_estagio, horas_semanais_estagio, horas_diarias_estagio, nome_supervisor
from estagio e inner join aluno a
on e.idaluno_FK = a.idaluno 
and e.data_inicio_estagio like "%2019-10-20%" 
and e.data_final_estagio like "%2%" 
inner join empresa em 
on e.idempresa_FK = em.idempresa
and em.nome_empresa like '%a%'
inner join supervisor s
on e.idsupervisor_FK = s.idsupervisor;

select nome_aluno, nome_empresa, data_inicio_estagio, data_final_estagio, horas_totais_estagio 
from estagio e inner join aluno a
on e.idaluno_FK = a.idaluno 
inner join empresa em 
on e.idempresa_FK = em.idempresa
and em.nome_empresa = "teste";

select nome_aluno, nome_empresa, data_inicio_estagio, data_final_estagio, horas_totais_estagio 
from estagio e inner join aluno a
on e.idaluno_FK = a.idaluno 
and e.data_inicio_estagio = "2019-10-20" 
inner join empresa em 
on e.idempresa_FK = em.idempresa;

select nome_aluno, nome_empresa, data_inicio_estagio, data_final_estagio, horas_totais_estagio 
from estagio e inner join aluno a
on e.idaluno_FK = a.idaluno 
and e.data_final_estagio = "2019-11-20" 
inner join empresa em 
on e.idempresa_FK = em.idempresa;

			select nome_aluno, nome_empresa, data_inicio_estagio, data_final_estagio, horas_totais_estagio 
            from estagio e inner join aluno a
            on e.idaluno_FK = a.idaluno 
            and e.data_inicio_estagio = '%1%'
            and e.data_final_estagio = '%2%' 
            inner join empresa em 
            on e.idempresa_FK = em.idempresa
            and em.nome_empresa like '%t%';
