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
    Mail varchar(45) unique,
    Password varchar(25)
) engine = innodb;

/*
* TABELLA MATERIA
*/
create table if not exists Materia(
	ID_Materia int auto_increment primary key,
    Nome_Materia varchar(45)
) engine = innodb;

/*
* TABELLA DOCENTE-MATERIA
*/
create table if not exists Doc_Mat(
	ID_Docente int,
    ID_Materia int,
    primary key (ID_Docente, ID_Materia)
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
* TABELLA DIFFICOLTÀ
*/
create table if not exists Difficolta(
	valore varchar(15) primary key
) engine = innodb;

/*
* TABELLA DOMANDA
*/
create table if not exists Domanda(
	ID_Domanda int auto_increment primary key,
	testoDomanda text,
	pubblica boolean,
    usata boolean,
    immagine blob,
	ID_Docente int,
	ID_Categoria int,
    difficolta varchar(15)
) engine = innodb;
alter table Domanda add foreign key (ID_Docente) references Docente(ID_Docente);
alter table Domanda add foreign key (ID_Categoria) references Categoria(ID_Categoria);
alter table Domanda add foreign key (difficolta) references Difficolta(valore);

/*
* TABELLA SERIE
*/
create table if not exists Serie(
	ID_Serie int auto_increment primary key,
    pdf blob,
    ID_Docente int,
    difficolta varchar(15)
) engine = innodb;
alter table Serie add foreign key (ID_Docente) references Docente(ID_Docente);
alter table Serie add foreign key (difficolta) references Difficolta(valore);
