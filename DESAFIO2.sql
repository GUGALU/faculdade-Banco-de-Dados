DROP DATABASE IF EXISTS academia_de_artes_marciais;
CREATE DATABASE academia_de_artes_marciais;
USE academia_de_artes_marciais;

CREATE TABLE mestre(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL UNIQUE,
graduacao VARCHAR(255) NOT NULL UNIQUE,
numero_federativo VARCHAR(255) NOT NULL UNIQUE,
cpf VARCHAR(255) NOT NULL UNIQUE,
telefone_primario VARCHAR(255) NOT NULL,
telefone_secundario VARCHAR(255) NOT NULL,
rua VARCHAR(255) NOT NULL,
numero VARCHAR(255) NOT NULL,
cep VARCHAR(255) NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT "S"
);

INSERT INTO mestre(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,rua,numero,cep) VALUES("OLDER","SEXTO DAN","010101","123.123.123-12","0000-0000","1111-1111","RUA DAS FLORES","545","98090-090");
INSERT INTO mestre(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,rua,numero,cep) VALUES("LUIZA","FAIXA BRANCA","010102","123.123.123-13","0000-0000","1111-1111","RUA DAS FLORES","545","98090-090");
INSERT INTO mestre(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,rua,numero,cep) VALUES("JULIANA","FAIXA AZUL","010103","123.123.123-14","0000-0000","1111-1111","RUA DAS FLORES","545","98090-090");


CREATE TABLE professor(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL UNIQUE,
graduacao VARCHAR(255) NOT NULL UNIQUE,
numero_federativo VARCHAR(255) NOT NULL UNIQUE,
cpf VARCHAR(255) NOT NULL UNIQUE,
telefone_primario VARCHAR(255) NOT NULL,
telefone_secundario VARCHAR(255) NOT NULL,
rua VARCHAR(255) NOT NULL,
numero VARCHAR(255) NOT NULL,
cep VARCHAR(255) NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT "S"
);

INSERT INTO professor(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,rua,numero,cep) VALUES("GUSTAVO","PRIMEIRO DAN","010104","123.123.123-15","0000-0000","1111-1111","RUA DAS FLORES","545","98090-090");
INSERT INTO professor(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,rua,numero,cep) VALUES("DANILLO","TERCEIRO DAN","010105","123.123.123-16","0000-0000","1111-1111","RUA DAS FLORES","545","98090-090");
INSERT INTO professor(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,rua,numero,cep) VALUES("OLDER","SEXTO DAN","010106","123.123.123-17","0000-0000","1111-1111","RUA DAS FLORES","545","98090-090");


CREATE TABLE alunos(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL UNIQUE,
graduacao VARCHAR(255) NOT NULL UNIQUE,
numero_federativo INT NOT NULL UNIQUE,
cpf VARCHAR(255) NOT NULL UNIQUE,
telefone_primario INT NOT NULL,
telefone_secundario INT NOT NULL,
rua VARCHAR(255) NOT NULL,
numero VARCHAR(255) NOT NULL,
cep VARCHAR(255) NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT "S"
);

INSERT INTO alunos(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,rua,numero,cep) VALUES("GUSTAVO","SEGUNDO DAN","010109","123.123.123-18","0000-0000","1111-1111","RUA DAS FLORES","545","98090-090");
INSERT INTO alunos(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,rua,numero,cep) VALUES("JOÃO","QUINTO DAN","010108","123.123.123-19","0000-0000","1111-1111","RUA DAS FLORES","545","98090-090");
INSERT INTO alunos(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,rua,numero,cep) VALUES("PEDRO","QUARTO DAN","010107","123.123.123-31","0000-0000","1111-1111","RUA DAS FLORES","545","98090-090");

CREATE TABLE lista_de_presenca(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
data_da_aula DATETIME NOT NULL,
professor VARCHAR(255) NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT 'S'
);

SELECT * FROM lista_de_presenca;

CREATE TABLE exame_de_faixa(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
data_do_exame DATE NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT 'S',
CONSTRAINT FOREIGN KEY (id_ficha_avaliativa) REFERENCES ficha_avaliativa(id),
CONSTRAINT FOREIGN KEY (id_resultados) REFERENCES resultados(id)
);

SELECT * FROM exame_de_faixa;

CREATE TABLE ficha_avaliativa(
id INT PRIMARY KEY NOT NULL,
professor_responsavel VARCHAR(255),
ativo CHAR(1) NOT NULL DEFAULT 'S'
);

SELECT * FROM ficha_avaliativa;

CREATE TABLE resultados(
id INT PRIMARY KEY NOT NULL,
colocacao VARCHAR(255),
ativo CHAR(1) NOT NULL DEFAULT 'S'
);

SELECT * FROM resultados;
