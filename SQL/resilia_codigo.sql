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
idade INT NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE turmas (
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100),
turno VARCHAR(6),
numero_de_alunos INT,
aluno_id BIGINT NOT NULL,
professor_id BIGINT NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE unidades(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100),
cep VARCHAR(8),
cursos_id BIGINT,
PRIMARY KEY(id)
);

CREATE TABLE cursos(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100),
descricao TEXT,
data_comeco DATE,
data_termino DATE,
turmas_id BIGINT,
unidades_id BIGINT,
PRIMARY KEY(id)
);

ALTER TABLE turmas 
ADD CONSTRAINT fk_alunoT FOREIGN KEY(aluno_id) REFERENCES alunos(id);

ALTER TABLE turmas 
ADD CONSTRAINT fk_professorT FOREIGN KEY(professor_id) REFERENCES professores(id);

ALTER TABLE unidades
ADD CONSTRAINT fk_cursosU FOREIGN KEY(cursos_id) REFERENCES cursos(id);

ALTER TABLE cursos
ADD CONSTRAINT fk_turmasC FOREIGN KEY(turmas_id) REFERENCES turmas(id);

ALTER TABLE cursos
ADD CONSTRAINT fk_unidadesC FOREIGN KEY(unidades_id) REFERENCES unidades(id);