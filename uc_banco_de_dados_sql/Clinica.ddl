-- CREATE DATABASE Clinica;

DROP TABLE IF EXISTS ambulatorios;
DROP TABLE IF EXISTS medicos;
DROP TABLE IF EXISTS paciente;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS consultas;
USE Clinica;
CREATE TABLE ambulatorios(
    nroa  INT PRIMARY KEY,
    andar    NUMERIC(3) NOT NULL,
    capacidade  SMALLINT
);

CREATE TABLE medicos (
    codm  INT PRIMARY KEY,
    nome  VARCHAR(40) NOT NULL, 
    idade  SMALLINT NOT NULL ,
    especialidade  CHAR(20),
    cpf  NUMERIC(11) UNIQUE, 
    cidade  VARCHAR(30),
    nroa  INT,
    FOREIGN KEY (nroa) REFERENCES  ambulatorios (nroa)
);

CREATE TABLE paciente (
    codp  INT PRIMARY KEY,
    nome  VARCHAR(40) NOT NULL,
    idade  SMALLINT NOT NULL,
    cidade  CHAR(30),  
    cpf  NUMERIC(11) UNIQUE, 
    doenca  VARCHAR(40) NOT NULL
);

CREATE TABLE funcionario (
    codf  INT PRIMARY KEY,
    nome  VARCHAR(40) NOT NULL,
    idade  SMALLINT,
    cpf  NUMERIC(11) UNIQUE,
    cidade  VARCHAR(30),
    salario  NUMERIC(10, 2), 
    cargo  VARCHAR(20)
);

CREATE TABLE consultas (
    codm  INT,
    codp  INT, 
    data  DATE,
    hora  TIME,
    PRIMARY KEY (codm, codp, data, hora),
    FOREIGN KEY (codm) REFERENCES medicos (codm),
    FOREIGN KEY (codp) REFERENCES paciente(codp)
);

-- Adicionar a coluna nroa na tabela funcionario
ALTER TABLE funcionario
ADD nroa INT;
-- Adicionar a chave estrangeira para a tabela ambulatorios
ALTER TABLE funcionario
ADD CONSTRAINT fk_funcionario_ambulatorios
FOREIGN KEY (nroa) REFERENCES ambulatorios(nroa);