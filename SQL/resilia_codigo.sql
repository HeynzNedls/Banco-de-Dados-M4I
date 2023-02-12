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

INSERT INTO alunos (nome, cpf, sexo, contato, cep, email, nascimento)
VALUES
('Aluno 1', '1111111111111', 'M', '11 11111-1111', '11111111', 'aluno.1@gmail.com', '28-04-2002'),
('Aluno 2', '2222222222222', 'F', '22 22222-2222', '22222222', 'aluno_2@hotmail.com', '29-10-2004');

INSERT INTO professores (nome, cpf, sexo, contato, cep, email, nascimento)
VALUES
('Professor 1', '3333333333333', 'M', '33 33333-3333', '33333333', 'professor.1@hotmail.com', '02-01-1974'),
('Professor 2', '4444444444444', 'F', '44 44444-4444', '44444444', 'professor_2@gmail.com', '05-06-1957');

INSERT INTO turmas (nome, turno, numero_de_alunos, aluno_id, professor_id)
VALUES
('Class A', 'evening', 15, 1, 2),
('Class B', 'morning', 25, 2, 1);

INSERT INTO cursos (nome, descricao, data_comeco, data_termino, turmas_id)
VALUES
('Front 105', 'Front-End', '2022-03-01', '2023-05-30', 1),
('Back 103', 'Back-End', '2022-04-01', '2023-06-31', 2);

INSERT INTO unidades (nome, cep, cursos_id)
VALUES
('Campus C', '22233344', 1),
('Campus D', '44455566', 2);
