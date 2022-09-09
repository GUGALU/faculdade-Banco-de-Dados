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
    sigla_estado CHAR(2) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
	rua VARCHAR(255) NOT NULL,
	numero VARCHAR(255) NOT NULL,
	cep VARCHAR(255) NOT NULL,
	ativo CHAR(1) NOT NULL DEFAULT "S"
);

INSERT INTO mestre(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,sigla_estado,cidade,rua,numero,cep) 
	VALUES("OLDER","SEXTO DAN","010101","123.123.123-12","0000-0000","1111-1111","PR","PARANAVAÍ","RUA DAS FLORES","545","98090-090");
INSERT INTO mestre(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,sigla_estado,cidade,rua,numero,cep) 
	VALUES("LUIZA","FAIXA BRANCA","010102","123.123.123-13","0000-0000","1111-1111","PR","PARANAVAÍ","RUA DAS FLORES","610","98090-090");
INSERT INTO mestre(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,sigla_estado,cidade,rua,numero,cep) 
	VALUES("JULIANA","FAIXA AZUL","010103","123.123.123-14","0000-0000","1111-1111","PR","PARANAVAÍ","RUA DAS FLORES","150","98090-090");

SELECT
	mestre.nome "NOME",
    mestre.graduacao "GRADUAÇÃO",
    mestre.numero_federativo "NUMERO FEDERATIVO",
    mestre.telefone_primario "N° DE TELEFONE"
    FROM mestre;
    
CREATE TABLE professor(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL UNIQUE,
	graduacao VARCHAR(255) NOT NULL UNIQUE,
	numero_federativo VARCHAR(255) NOT NULL UNIQUE,
	cpf VARCHAR(255) NOT NULL UNIQUE,
	telefone_primario VARCHAR(255) NOT NULL,
	telefone_secundario VARCHAR(255) NOT NULL,
    sigla_estado CHAR(2) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
	rua VARCHAR(255) NOT NULL,
	numero VARCHAR(255) NOT NULL,
	cep VARCHAR(255) NOT NULL,
	ativo CHAR(1) NOT NULL DEFAULT "S"
);

INSERT INTO professor(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,sigla_estado,cidade,rua,numero,cep) 
	VALUES("GUSTAVO","PRIMEIRO DAN","010104","123.123.123-15","0000-0000","1111-1111","PR","PARANAVAÍ","RUA DAS FLORES","510","98090-090");
INSERT INTO professor(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,sigla_estado,cidade,rua,numero,cep) 
	VALUES("DANILLO","TERCEIRO DAN","010105","123.123.123-16","0000-0000","1111-1111","PR","PARANAVAÍ","RUA DAS FLORES","450","98090-090");
INSERT INTO professor(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,sigla_estado,cidade,rua,numero,cep) 
	VALUES("OLDER","SEXTO DAN","010106","123.123.123-17","0000-0000","1111-1111","PR","PARANAVAÍ","RUA DAS FLORES","600","98090-090");

CREATE TABLE alunos(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL UNIQUE,
	graduacao VARCHAR(255) NOT NULL UNIQUE,
	numero_federativo INT NOT NULL UNIQUE,
	cpf VARCHAR(255) NOT NULL UNIQUE,
	telefone_primario VARCHAR(255) NOT NULL,
	telefone_secundario VARCHAR(255) NOT NULL,
    sigla_estado CHAR(2) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
	rua VARCHAR(255) NOT NULL,
	numero VARCHAR(255) NOT NULL,
	cep VARCHAR(255) NOT NULL,
	ativo CHAR(1) NOT NULL DEFAULT "S"
);

INSERT INTO alunos(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,sigla_estado,cidade,rua,numero,cep) 
	VALUES("GUSTAVO","SEGUNDO DAN","010109","123.123.123-18","0000-0000","1111-1111","PR","PARANAVAÍ","RUA DAS FLORES","540","98090-090");
INSERT INTO alunos(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,sigla_estado,cidade,rua,numero,cep) 
	VALUES("JOÃO","QUINTO DAN","010108","123.123.123-19","0000-0000","1111-1111","PR","PARANAVAÍ","RUA DAS FLORES","200","98090-090");
INSERT INTO alunos(nome,graduacao,numero_federativo,cpf,telefone_primario,telefone_secundario,sigla_estado,cidade,rua,numero,cep) 
	VALUES("PEDRO","QUARTO DAN","010107","123.123.123-31","0000-0000","1111-1111","PR","PARANAVAÍ","RUA DAS FLORES","300","98090-090");

CREATE TABLE lista_de_presenca(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	data_da_aula DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	professor VARCHAR(255) NOT NULL,
	nome_alunos VARCHAR(255) NOT NULL,
	presenca_falta CHAR(1) NOT NULL DEFAULT "F",
	ativo CHAR(1) NOT NULL DEFAULT "S",
	CONSTRAINT fk_aluno FOREIGN KEY (nome_alunos) REFERENCES alunos(nome),
	CONSTRAINT presenca_deve_ser_C_ou_F CHECK (ativo IN ("S", "N"))
);

INSERT INTO lista_de_presenca(professor,nome_alunos,presenca_falta) VALUES("OLDER", "GUSTAVO", "C");
INSERT INTO lista_de_presenca(professor,nome_alunos,presenca_falta) VALUES("OLDER", "JOÃO", "F");
INSERT INTO lista_de_presenca(professor,nome_alunos,presenca_falta) VALUES("OLDER", "PEDRO", "C");

SELECT 
	lista.data_da_aula "DATA DA AULA",
    lista.professor "PROFESSOR QUE DEU A AULA",
    alunos.nome "ALUNO",
    lista.presenca_falta "COMPARECEU/FALTOU"
	FROM lista_de_presenca lista, alunos
	WHERE
    alunos.nome = lista.nome_alunos;

CREATE TABLE ficha_avaliativa(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	professor_responsavel VARCHAR(255),
	nome_aluno VARCHAR(255),
	notas VARCHAR(255),
	porcentagem_acerto VARCHAR(255),
	data_do_exame DATETIME NOT NULL,
	ativo CHAR(1) NOT NULL DEFAULT "S"
);

INSERT INTO ficha_avaliativa(professor_responsavel,nome_aluno,notas,porcentagem_acerto,data_do_exame) VALUES("OLDER","GUSTAVO","8","80%","2020-12-20");
INSERT INTO ficha_avaliativa(professor_responsavel,nome_aluno,porcentagem_acerto,data_do_exame) VALUES("OLDER","JOAO","64%","2020-12-11");
INSERT INTO ficha_avaliativa(professor_responsavel,nome_aluno,notas,porcentagem_acerto,data_do_exame) VALUES("OLDER","PEDRO","++--+-","50%","2020-12-11");

SELECT 
	ficha.id "ID",
    ficha.professor_responsavel "PROFESSOR RESPONSAVEL",
    ficha.nome_aluno "ALUNO",
    ficha.porcentagem_acerto "PORCENTAGEM DE ACERTO",
    ficha.data_do_exame "DATA DO EXAME"
	FROM ficha_avaliativa ficha;

CREATE TABLE exame_de_faixa(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	tempo_de_faixa VARCHAR(255),
	carencia_atingida CHAR(1) NOT NULL DEFAULT "N",
	faixa_antes_e_depois VARCHAR(255),
	ativo CHAR(1) NOT NULL DEFAULT "S",
	id_ficha_avaliativa INT NOT NULL,
	CONSTRAINT fk_ficha_avaliativa FOREIGN KEY (id_ficha_avaliativa) REFERENCES ficha_avaliativa(id)
);

INSERT INTO exame_de_faixa(tempo_de_faixa,carencia_atingida,faixa_antes_e_depois,id_ficha_avaliativa) VALUES("13 MESES","S","BRANCA - AMARELA",1);
INSERT INTO exame_de_faixa(tempo_de_faixa,carencia_atingida,faixa_antes_e_depois,id_ficha_avaliativa) VALUES("3 MESES","N","BRANCA - AMARELA",2);
INSERT INTO exame_de_faixa(tempo_de_faixa,carencia_atingida,faixa_antes_e_depois,id_ficha_avaliativa) VALUES("6 MESES","S","AMARELA - LARANJA",3);

SELECT 
	alunos.id "ID ALUNO",
	alunos.nome "NOME DO ALUNO",
    exame.tempo_de_faixa "TEMPO DO ALUNO NA FAIXA",
    exame.carencia_atingida "ALUNO ATINGIU O TMEPO MINIMO NA FAIXA?",
    exame.faixa_antes_e_depois "FAIXA ANTES DO EXAME E DEPOIS DO EXAME"
	FROM alunos,exame_de_faixa exame
    WHERE
    alunos.id = exame.id;
    
CREATE TABLE competicoes(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	data_competicao DATETIME NOT NULL,
	nome_competicao VARCHAR(255) NOT NULL,
	colocacao VARCHAR(255),
	ativo CHAR(1) NOT NULL DEFAULT "S",
	id_alunos INT NOT NULL,
	CONSTRAINT fk_alunos FOREIGN KEY (id_alunos) REFERENCES alunos(id)
);

INSERT INTO competicoes(data_competicao,nome_competicao,colocacao,id_alunos) VALUES("2019-10-11","CAMPEONATO PARANAENSE","SEGUNDO LUGAR",1);
INSERT INTO competicoes(data_competicao,nome_competicao,colocacao,id_alunos) VALUES("2015-12-13","CAMPEONATO MACRO REGIONAL","PRIMEIRO LUGAR",2);
INSERT INTO competicoes(data_competicao,nome_competicao,colocacao,id_alunos) VALUES("2017-01-03","CAMPEONATO BRASILEIRO","SETIMO LUGAR",3);

SELECT 
		competicoes.id "ID",
		competicoes.data_competicao "DATA DA COMPETICAO",
	    competicoes.nome_competicao "NOME DA COMPETICAO",
		competicoes.colocacao "COLOCAÇÃO NA COMPETICÇÃO",
		alunos.nome "NOME DO ALUNO",
		alunos.graduacao "GRADUACAO DO ALUNO"
		FROM 
        competicoes, alunos
        WHERE
		competicoes.id = alunos.id;
