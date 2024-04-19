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

create table if not exists