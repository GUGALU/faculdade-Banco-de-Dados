DROP DATABASE IF EXISTS academia_de_artes_marciais;
CREATE DATABASE academia_de_artes_marciais;
USE academia_de_artes_marciais;

CREATE TABLE mestre(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL UNIQUE,
ativo CHAR(1) NOT NULL DEFAULT "S"
);

INSERT INTO mestre(nome) VALUES("OLDER");
INSERT INTO mestre(nome) VALUES("LUIZA");
INSERT INTO mestre(nome) VALUES("JULIANA");


CREATE TABLE professor(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL UNIQUE,
ativo CHAR(1) NOT NULL DEFAULT "S"
);

INSERT INTO professor(nome) VALUES("GUSTAVO");
INSERT INTO professor(nome) VALUES("DANILLO");
INSERT INTO professor(nome) VALUES("OLDER");


CREATE TABLE alunos(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL UNIQUE,
ativo CHAR(1) NOT NULL DEFAULT "S"
);

INSERT INTO alunos(nome) VALUES("GUSTAVO");
INSERT INTO alunos(nome) VALUES("JOÃO");
INSERT INTO alunos(nome) VALUES("PEDRO");


CREATE TABLE dados(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
graduacao VARCHAR(255) NOT NULL UNIQUE,
numero_federativo INT NOT NULL UNIQUE,
cpf BIGINT NOT NULL UNIQUE,
id_alunos INT NOT NULL,
id_mestre INT NOT NULL,
id_professor INT NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT 'S'
);

ALTER TABLE dados
	ADD FOREIGN KEY (id_alunos) REFERENCES alunos(id);

ALTER TABLE dados
	ADD FOREIGN KEY (id_mestre) REFERENCES mestre(id);
    
ALTER TABLE dados
	ADD FOREIGN KEY (id_professor) REFERENCES professor(id);

INSERT INTO dados(graduacao,numero_federativo,cpf,id_professor,id_mestre,id_alunos) VALUES("FAIXA PRETA", 123123123,12343212345,1,1,1);
INSERT INTO dados(graduacao,numero_federativo,cpf,id_professor,id_mestre,id_alunos) VALUES("FAIXA AZUL", 123123126,12343212346,1,1,1);
INSERT INTO dados(graduacao,numero_federativo,cpf,id_professor,id_mestre,id_alunos) VALUES("FAIXA BRANCA", 123123127,12343212347,1,1,1);