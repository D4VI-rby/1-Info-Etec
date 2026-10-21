/*Davi Ribeiro, Guilherme e Rafael Ribeiro*/
create database bdEscola;
use bdEscola;

create table tbAluno (
    idAluno INTEGER primary key auto_increment,
    nome varchar(100),
    genero varchar(30),
    data_nasci date
);

create table tbProfessor (
    idProf INTEGER primary key auto_increment,
    nome varchar(100),
    idade int,
    genero varchar(30),
    titulacao varchar(100)
);

create table tbCurso (
    idCurso INTEGER primary key auto_increment,
    nome varchar(100),
    carga_horaria_curso int
);

create table tbMatricula (
    idMat INTEGER primary key auto_increment,
    data_mat date,
    idCurso INTEGER,
    idAluno INTEGER,
    foreign key (idCurso) references tbCurso (idCurso),
    foreign key (idAluno) references tbAluno (idAluno)
);

create table tbDisciplina (
    idDisc INTEGER primary key auto_increment,
    nome varchar(100),
    carga_horaria_disc int,
    idCurso INTEGER,
    foreign key (idCurso) references tbCurso (idCurso)
);

create table tbNota (
    idNota INTEGER primary key auto_increment,
    nota decimal(3,1),
    idAluno INTEGER,
    idDisc INTEGER,
    foreign key (idAluno) references tbAluno (idAluno),
    foreign key (idDisc) references tbDisciplina (idDisc)
);

create table tbAula (
    idAula INTEGER primary key auto_increment,
    data_aula date,
    idProf INTEGER,
    idDisc INTEGER,
    foreign key (idProf) references tbProfessor (idProf),
    foreign key (idDisc) references tbDisciplina (idDisc)
);

insert into tbAluno (nome, genero, data_nasci) values
('Ana Souza',        'Feminino',  '2003-02-14'),
('Bruno Lima',       'Masculino', '2002-07-30'),
('Carla Mendes',     'Feminino',  '2004-11-05'),
('Diego Alves',      'Masculino', '2001-04-22'),
('Eduarda Rocha',    'Feminino',  '2003-09-18'),
('Felipe Santos',    'Masculino', '2000-12-01'),
('Gabriela Costa',   'Feminino',  '2004-03-27'),
('Henrique Duarte',  'Masculino', '2002-01-09'),
('Isabela Martins',  'Feminino',  '2003-06-16'),
('João Pereira',     'Masculino', '2001-10-11');

insert into tbProfessor (nome, idade, genero, titulacao) values
('Marcos Oliveira',  45, 'Masculino', 'Doutor'),
('Patrícia Ferreira', 38, 'Feminino', 'Mestre'),
('Roberto Nunes',    52, 'Masculino', 'Doutor');

insert into tbCurso (nome, carga_horaria_curso) values
('Análise e Desenvolvimento de Sistemas', 2400),
('Administração',                         3000);

insert into tbDisciplina (nome, carga_horaria_disc, idCurso) values
('Banco de Dados',    80, 1),
('Programação',       80, 1),
('Contabilidade',     60, 2),
('Gestão de Pessoas', 60, 2);

insert into tbMatricula (data_mat, idCurso, idAluno) values
('2024-02-01', 1, 1),
('2024-02-01', 1, 2),
('2024-02-02', 1, 3),
('2024-02-02', 2, 4),
('2024-02-03', 2, 5);

insert into tbNota (nota, idAluno, idDisc) values
(8.5, 1, 1),
(9.0, 1, 2),
(7.0, 2, 1),
(6.5, 2, 2),
(8.0, 3, 1),
(9.5, 4, 3),
(7.5, 4, 4),
(5.5, 5, 3);

insert into tbAula (data_aula, idProf, idDisc) values
('2024-03-04', 1, 1),
('2024-03-06', 1, 1),
('2024-03-05', 2, 2),
('2024-03-07', 2, 2),
('2024-03-04', 3, 3),
('2024-03-06', 3, 4);

select * from tbAluno;
select nome, carga_horaria_curso from tbCurso;