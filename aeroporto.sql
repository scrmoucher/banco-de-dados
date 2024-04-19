create database RESERVA_DE_VOOS;
use RESERVA_DE_VOOS;

create table if not exists PASSAGEIROS(
ID_passageiros int(10)primary key,
NOME varchar(20)not null,
SOBRENOME varchar(50)not null,
DATA_NASC date not null,
NACIONALIDADE varchar(45)not null);

create table if not exists RESERVAS_DE_VOOS(
COD_RESERVA int(10)primary key,
DATA_RESERVA varchar(45)not null,
FORMA_PAGAMENTO enum('pequeno')not null,
VALOR_TOTAL decimal(10,2));

create table if not exists COMPANHIA_AEREA(
ID_COMPANHIA int(10)primary key,
NOME varchar(45)not null,
CNPJ varchar(45)not null);

create table if not exists AEROPORTOS(
COD_AEROPORTOS varchar(45)primary key,
NOME varchar(45)not null,
RUA varchar(40)not null,
BAIRRO varchar (40)not null,
CIDADE varchar(45)not null,
ESTADO varchar (45) not null,
PAIS varchar (100) not null,
TELEFONE varchar (45) not null);

create table if not exists VOOS(
ID_VOOS INT(10)primary key,
ASSENTO varchar(50) primary key,
DATA_PARTIDA date not null,
DATA_CHEGADA_PREV date not null,
HORA_PARTIDA time not null,
HORA_CHEGADA_PREV time not null,
constraint AERONAVE foreign key (COD_AERONAVE)
references AERONAVE(COD_AERONAVE),
constraint AEROPORTO)
