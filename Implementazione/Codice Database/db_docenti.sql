drop database db_eserciziario;
create database if not exists db_eserciziario;
use db_eserciziario;

/*
* CREAZIONE UTENTE PER L'ACCESSO AL DATABASE
*/
create user if not exists 'rootEserciziario'@'%' identified by 'Password&1';
grant insert, update, delete, select on db_eserciziario.* to 'rootEserciziario'@'%';

/*
* TABELLA DOCENTE
*/
create table if not exists Docente(
	ID_Docente int auto_increment primary key,
    Nome varchar(25),
    Cognome varchar(25),
    Mail varchar(25) unique,
    Password varchar(25)
) engine = innodb;

/*
* TABELLA MATERIA
*/
create table if not exists Materia(
	ID_Materia int auto_increment primary key,
    Nome_Materia varchar(25)
) engine = innodb;

/*
* TABELLA DOCENTE-MATERIA
*/
create table if not exists Doc_Mat(
	ID_Docente int primary key,
    ID_Materia int unique
) engine = innodb;
alter table Doc_Mat add foreign key (ID_Docente) references Docente(ID_Docente);
alter table Doc_Mat add foreign key (ID_Materia) references Materia(ID_Materia);

/*
* TABELLA CATEGORIA
*/
create table if not exists Categoria(
	ID_Categoria int auto_increment primary key,
	Nome_Categoria varchar(25),
	ID_Materia int
) engine = innodb;
alter table Categoria add foreign key (ID_Materia) references Materia(ID_Materia);

/*
* TABELLA DOMANDA
*/
create table if not exists Domanda(
	ID_Domanda int auto_increment primary key,
	testoDomanda text,
	pubblica boolean,
    usata boolean,
	ID_Docente int,
	ID_Categoria int
) engine = innodb;
alter table Domanda add foreign key (ID_Docente) references Docente(ID_Docente);
alter table Domanda add foreign key (ID_Categoria) references Categoria(ID_Categoria);