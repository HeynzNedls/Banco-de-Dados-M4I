CREATE DATABASE resilia
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
USE resilia;


CREATE TABLE alunos (
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100),
cpf VARCHAR(14),
sexo CHAR(1),
contato VARCHAR(22),
cep VARCHAR(8),
email VARCHAR(100),
nascimento DATE,
PRIMARY KEY(id)
);

CREATE TABLE professores (
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100),
cpf VARCHAR(14),
sexo CHAR(1),
contato VARCHAR(22),
cep VARCHAR(8),
email VARCHAR(100),
nascimento DATE,
PRIMARY KEY(id)
);

CREATE TABLE turmas (
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100),
turno VARCHAR(6),
numero_de_alunos INT,
aluno_id BIGINT,
professor_id BIGINT,
PRIMARY KEY(id),
FOREIGN KEY(aluno_id) REFERENCES alunos(id),
FOREIGN KEY(professor_id) REFERENCES professores(id)
);

CREATE TABLE cursos(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100),
descricao TEXT,
data_comeco DATE,
data_termino DATE,
turmas_id BIGINT,
PRIMARY KEY(id),
FOREIGN KEY(turmas_id) REFERENCES turmas(id)
);

CREATE TABLE unidades(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100),
cep VARCHAR(8),
cursos_id BIGINT,
PRIMARY KEY(id),
FOREIGN KEY(cursos_id) REFERENCES cursos(id)
);
