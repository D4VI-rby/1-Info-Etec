create database bdEscola;
use bdEscola1;

create table professor(
	idProfessor INTEGER primary key auto_increment,
    nome varchar(100),
    disciplina varchar(100),
    turma varchar(2)
);

INSERT INTO professor (nome, disciplina, turma) VALUES
('Ana Silva', 'Matemática', '1A'),
('Bruno Costa', 'Português', '1B'),
('Carla Souza', 'História', '2A'),
('Daniel Lima', 'Geografia', '2B'),
('Eduardo Alves', 'Matemática', '3A'),
('Fernanda Rocha', 'Português', '3B'),
('Gabriel Santos', 'Física', '1A'),
('Helena Martins', 'Química', '2A'),
('Igor Pereira', 'Biologia', '3A'),
('Juliana Gomes', 'História', '1B');

update professor 
set turma = '3C'
where disciplina =  'Matemática';
select nome from professor;
select nome, disciplina from professor;
select nome, disciplina from professor where disciplina = 'Matemática';
select nome, turma from professor where turma = '1A';
select nome, turma from professor where turma = '3A';
select nome, disciplina from professor where disciplina = 'História';
select nome, disciplina from professor where disciplina = 'Português';
select nome, turma from professor where turma = '2A';
select nome, turma from professor where turma = '1B';
select count(*) from professor;
select count(*) from professor where disciplina = 'Matemática';
select count(*) from professor where disciplina = 'Português';
select count(*) from professor where turma = '1B';
select count(*) from professor where turma = '3A';

update professor 
set disciplina = 'Sociologia'
where id = 4 ;

update professor 
set turma = '3B'
where nome = 'Helena Martins';

update professor 
set disciplina = 'Ciências'
where nome = 'Igor Pereira';

update professor 
set turma = '3C'
where disciplina =  'Matemática';

update professor 
set disciplina = 'Projeto de vida'
where turma = '1B';

select nome from professor where id = 7;
select nome from professor where disciplina = 'História';
select nome, disciplina from professor where turma = '1A' ;
select count(*) from professor where turma = '3A';
select nome from professor where disciplina = 'Português';
select nome from professor where id = 8;























