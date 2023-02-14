CREATE DATABASE resilia
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
USE resilia;

-- CRIANDO TABELA ALUNOS

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

-- CRIANDO TABELA PROFESSORES

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

-- CRIANDO TABELA TURMAS

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

-- CRIANDO TABELA CURSOS

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

-- CRIANDO TABELA UNIDADE

CREATE TABLE unidades(
id BIGINT NOT NULL AUTO_INCREMENT,
nome VARCHAR(100),
cep VARCHAR(8),
cursos_id BIGINT,
PRIMARY KEY(id),
FOREIGN KEY(cursos_id) REFERENCES cursos(id)
);

-- INSERINDO DADOS NA TABELA ALUNOS

INSERT INTO alunos (nome, cpf, sexo, contato, cep, email, nascimento)
VALUES 
("John Doe", "111.111.111-11", "M", "91234-5678", "12345678", "johndoe@email.com", "1995-01-01"),
("Jane Doe", "222.222.222-22", "F", "92345-6789", "23456789", "janedoe@email.com", "1997-02-02"),
("Jim Smith", "333.333.333-33", "M", "91234-5678", "34567890", "jimsmith@email.com", "1999-03-03");

-- INSERINDO DADOS NA TABELA PROFESSORES

INSERT INTO professores (nome, cpf, sexo, contato, cep, email, nascimento)
VALUES 
("Dr. Alice", "444.444.444-44", "F", "91234-5678", "45678901", "alice@email.com", "1980-04-04"),
("Dr. Bob", "555.555.555-55", "M", "92345-6789", "56789012", "bob@email.com", "1985-05-05"),
("Dr. Charlie", "666.666.666-66", "M", "91234-5678", "67890123", "charlie@email.com", "1990-06-06");

-- INSERINDO DADOS NA TABELA TURMAS

INSERT INTO turmas (nome, turno, numero_de_alunos, aluno_id, professor_id)
VALUES 
("Turma A", "Manhã", 20, 1, 1),
("Turma B", "Tarde", 25, 2, 2),
("Turma C", "Noite", 30, 3, 3);


-- INSERINDO DADOS NA TABELA CURSOS

INSERT INTO cursos (nome, descricao, data_comeco, data_termino, turmas_id)
VALUES 
("Curso 1", "Descrição do curso 1", "2023-01-01", "2023-06-30", 1),
("Curso 2", "Descrição do curso 2", "2023-07-01", "2023-12-31", 2),
("Curso 3", "Descrição do curso 3", "2024-01-01", "2024-06-30", 3);

-- INSERINDO DADOS NA TABELA UNIDADE

INSERT INTO unidades (nome, cep, cursos_id)
VALUES 
("Unidade 1", "12345678", 1),
("Unidade 2", "23456789", 2),
("Unidade 3", "34567890", 3);
