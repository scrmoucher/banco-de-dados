--- PASSO 1;
-- CRIAR BASE DE DADOS(CREAT SCHEMA OU CREAT DATABASE) 
 create database if not exists PROVA_SIN1;
-- IF NOT EXITES: NÃO CRIA SE JA HOUVER CRIADO


-- PASSO 2
-- CARREGAR A BASE DE DADOS CRIADA PARA USO
USE PROVA_SIN1;

-- PASSO 3
-- CRIAR AS TABELAS SEM CHAVE ESTRANGEIRA
CREATE TABLE IF NOT exists ALUNO(
MATRICULA INT PRIMARY KEY,
NOME VARCHAR(100)NOT NULL,
DATA_NASC DATE NOT NULL);

CREATE TABLE IF NOT EXISTS PROFESSOR(
NUM_ID INT PRIMARY KEY,
NOME VARCHAR(100) NOT NULL,
ESPECIALIZAÇÃO VARCHAR(100)NOT NULL);

CREATE TABLE IF NOT EXISTS CURSO(
COD_CURSO INT PRIMARY KEY,
NOME VARCHAR(100) NOT NULL,
DURAÇÃO VARCHAR(50) NOT NULL);

-- PASSO 4:
--  CRIAR AS TABELAS COM CHAVE ESTRANGEIRA
CREATE TABLE IF NOT EXISTS DISCIPLINA(
CODIGO INT PRIMARY KEY,
NOME_DISC VARCHAR(100) NOT NULL,
CARGA_HORARIA INT NOT NULL,
COD_CURSO INT NOT NULL,
CONSTRAINT CUR_DIS foreign key (COD_CURSO)references CURSO (COD_CURSO));

-- PASSO 5:
--  CRIAR AS ENTIDADES ASSOCIATIVAS, SE HOUVER.
create table IF NOT exists ALUNOS_DISCIPLINAS(
MATRICULA INT,
CODIGO INT,
PRIMARY KEY (MATRICULA, CODIGO),
foreign key(MATRICULA) REFERENCES ALUNO (MATRICULA),
FOREIGN KEY(CODIGO) REFERENCES DISCIPLINA(CODIGO));

CREATE TABLE IF NOT EXISTS ALUNOS_CURSOS(
MATRICULA INT,
COD_CURSO INT,
PRIMARY KEY (MATRICULA,COD_CURSO), 
FOREIGN KEY (MATRICULA) REFERENCES ALUNO(MATRICULA),
FOREIGN KEY (COD_CURSO) REFERENCES CURSO(COD_CURSO));
-- CHAVE ESTRANGEIRA(ATRIBUTO) REFERENCIA TABELA(CHAVE_PRIMARIA);

CREATE TABLE IF NOT EXISTS CURSO_PROFESSOR(
NUM_REG INT,
COD_CURSO INT,
PRIMARY KEY(NUM_REG, COD_CURSO),
FOREIGN KEY(NUM_REG) REFERENCES PROFESSOR(NUM_ID),
FOREIGN KEY(COD_CURSO) REFERENCES CURSO(COD_CURSO));
-- CHAVE ESTRANGEIRA (ATRIBUTO) REFERENCIA TABELA(CHAVE_PRIMARIA);