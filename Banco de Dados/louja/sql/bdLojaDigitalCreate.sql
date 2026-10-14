create database bdLojaDigital;

use bdLojaDigital;

create table tbCliente(
	idCliente int primary key auto_increment,
	nomeCliente varchar(100),
	emailCliente varchar(100),
	cpfCliente integer(14)
);

create table tbTelefone(
	idTelefone int primary key auto_increment,
	telefone varchar(15)
);

create table tbEndereco(
	idEndereco int primary key auto_increment,
	idCliente int,
	logradouroEndereco varchar(20),
	nomeLogradouro varchar(100),
	numeroEndereco varchar(100),
	complementoEndereco varchar(50),
	cidadeEndereco varchar(50),
	estadoEndereco varchar(50),
	cepEndereco varchar(9),
	foreign key (idCliente) references tbCliente(idCliente)
);

create table tbCategoria(
	idCategoria int primary key auto_increment,
	nomeCategoria varchar(50),
	descricaoCategoria varchar(200)
);

create table tbProduto(
	idProduto int primary key auto_increment,
	idCategoria int,
	nomeProduto varchar(100),
	descricaoProduto varchar(200),
	precoProduto varchar(1000),
	estoqueProduto int,
	foreign key (idCategoria) references tbCategoria(idCategoria)
);

create table tbPedido(
	idPedido int primary key auto_increment,
	idCliente int,
	dataPedido date,
	statusPedido varchar(20),
	foreign key (idCliente) references tbCliente(idCliente)
);

create table tbItemPedido(
	idItemPedido int primary key auto_increment,
	idPedido int,
	idProduto int,
	quantidade int,
	precoUnitario varchar(30),
	foreign key (idPedido) references tbPedido(idPedido)
);