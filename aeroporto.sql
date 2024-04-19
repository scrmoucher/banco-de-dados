create database if not exists RESERVA_DE_VOOS;
use RESERVA_DE_VOOS;

create table if not exists PASSAGEIROS(
ID_passageiros int(10)primary key,
NOME varchar(20)not null,
SOBRENOME varchar(50)not null,
DATA_NASC date not null,
NACIONALIDADE varchar(45)not null);

create table if not exists RESERVAS_DE_VOOS(
COD_RESERVA int(10) primary key,
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

create table if not exists AERONAVE(
COD_AERONAVE int (10) primary key,
MODELO varchar(45) not null,
FABRICANTE varchar(45) not null,
ANO year(4) not null,
QUANTIDADE_ASSENTOS int not null);

create table if not exists VOOS(
ID_VOO INT (10) primary key,
ASSENTO varchar(50),
DATA_PARTIDA date not null,
DATA_CHEGADA_PREV date not null,
HORA_PARTIDA time not null,
HORA_CHEGADA_PREV time not null,
constraint AERONAVE foreign key (COD_AERONAVE)
references AERONAVE(COD_AERONAVE),
constraint AEROPORTOS foreign key (COD_AEROPORTOS_PARTIDA)
references AEROPORTOS (COD_AEROPORTOS_PARTIDA),
constraint AEROPORTOS foreign key (COD_AEROPORTO_CHEGADA)
references AEROPORTOS (COD_AEROPORTO_CHEGADA),
constraint COMPANHIA_AEREA foreign key (ID_COMPANHIA)
references COMPANHIA_AEREA (ID_COMPANHIA));

create table if not exists PASSAGEIROS_RESERVA(
constraint PASSAGEIROS foreign key (ID_PASSAGEIROS)
references PASSAGEIROS (ID_PASSAGEIROS),
constraint RESERVAS_DE_VOOS foreign key (COD_RESERVA)
references RESERVAS_DE_VOOS (COD_RESERVA));

create table if not exists VOOS_RESERVA(
constraint VOOS_AERONAVE  foreign key (COD_AERONAVE)
references VOOS_AERONAVE (COD_AERONAVES),
constraint VOOS_AERONAVE foreign key (COD_AEROPORTO_PARTIDA)
references VOOS_AERONAVE (COD_AEROPORTO_PARTIDA),
constraint VOOS_AERONAVE foreign key (COD_AEROPORTO_CHEGADA)
references VOOS_AERONAVE (COD_AEROPORTO_CHEGADA),
constraint VOOS_COMPANHIA_AEREA foreign key (ID_COMPANHIA)
references VOOS_COMPANHIA_AEREA (ID_COMPANHIA),
constraint VOOS foreign key (ASSENTO)
references VOOS(ASSENTO),
constraint RESERVA_DE_VOOS foreign key (COD_RESERVA)
references RESERVA_DE_VOOS(COD_RESERVA));

