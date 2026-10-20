create database bdEscola1;
use bdEscola1;

create table aluno1(
	idAluno1 INTEGER primary key auto_increment,
    nome varchar(100),
    idade int,
    curso varchar(100),
    nota decimal(3,1)
);
 
INSERT INTO aluno1 (nome, idade, curso, nota) VALUES 
('Ana', 20, 'Engenharia', 8.5), 
('Bruno', 22, 'Ciencia da Computacao', 9.2), 
('Carla', 19, 'Design', 7.8), 
('Daniel', 21, 'Engenharia', 8.0), 
('Eduarda', 20, 'Ciencia da Computacao',9.5), 
('Felipe', 23, 'Design', 6.9), 
('Gabriela', 18, 'Engenharia', 8.8),
('Henrique', 24, 'Ciencia da Computacao', 7.5), 
('Isabela', 22, 'Design', 9.0),
('Joao', 21, 'Engenharia', 7.2), 
('Karen', 20, 'Administracao', 8.3), 
('Lucas',25, 'Administracao', 6.8), 
('Mariana', 19, 'Marketing', 9.1), 
('Nicolas', 23,'Marketing', 7.7), 
('Olivia', 21, 'Pedagogia', 8.9), 
('Paulo', 24, 'Pedagogia',7.0), 
('Quezia', 20, 'Administracao', 9.4), 
('Rafael', 22, 'Marketing', 8.1),
('Sabrina', 18, 'Pedagogia', 8.6), 
('Thiago', 26, 'Ciencia da Computacao', 9.3);

select * from aluno1;
select nome from aluno1;
select nome, curso from aluno1;
select nome, curso from aluno1 where curso = 'Engenharia';
select nome, nota from aluno1 where nota > '8';
select nome from aluno1 order by nome asc;
select nome, nota from aluno1 order by nota desc;
select nome, nota from aluno1 order by nota desc limit 3;
select nome, idade from aluno1 where idade >= '22';
select nome, curso, nota from aluno1 where curso = 'Design' and nota > '8';
select nome, curso from aluno1 where curso <> 'Engenharia';
select count(*) from aluno1;
select max(nota) from aluno1;
select AVG(nota) from aluno1;
select nome, nota from aluno1 order by nota desc limit 5;
select nome, curso, nota from aluno1 where nota >= '8' order by nota desc limit 5;

update aluno1 
set nota = nota + 0.5 
where nota <= 6;

set sql_safe_updates=0;