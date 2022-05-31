-- SGBD Server : PostgreSQL
-- Cliente     : pgAdmin
-- Script      : ScriptSQL-02.sql

-- **********************
-- Aula 04 - 26/05/2022
-- **********************

-- Exemplo de Instrução DML

-- Inserir na tabela aluno
INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES (2022501453,'AMON MENEZES NEGREIROS','M','2001-08-31');

INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES (2022501462,'ANGEL GABRIEL DE SOUZA SALES','M','2001-01-31');

INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES (2022501471 ,'GABRIEL HENRIQUE FAUST','M','2001-02-25');

INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES (2022501480,'HENRIQUE FREITAS BARKETT','M','1998-07-01');

INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES (2022501490,'JOAO BATISTA PEREIRA DE OLIVEIRA','M','2001-07-24');

INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES (2022501506,'KALIL VINICIUS ANDRADE CARNEIRO','M','1999-09-23');

INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES (2022501515,'LUANA VIEIRA LINS','F','1999-03-07');

INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES (2022501604,'LUAN GABRIEL FERNANDES AIEZZA','M','2001-04-06');

INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES (2022501524,'MATHEUS FERNANDES OLIVEIRA','M','2001-07-27');

INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES (2022501533,'MIQUEIAS CAVALCANTI CRISPIM','M','2000-10-23');

INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES (2022501542,'PEDRO CARVALHO ALMEIDA','M','2002-03-02');

INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES (2022501551,'PEDRO HENRIQUE LOPES VASCONCELOS','M','2001-09-03');

INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES(2022501560,'RODRIGO MALKA RODRIGUES MARQUES', 'M', '2001-07-15');

INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES (2022501570,'SERGIO JUNIORS GARCEZ','M','2001-12-22');

INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES (2022501589,'STELLA APARECIDA HENRIQUE DA SILVA','F','1999-11-05');

INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES (2022501598 ,'THIAGO MUNIZ DE SOUZA','M','1998-11-05');

-- Inserir na tabela curso FIC
INSERT INTO "banco".curso_fic(nome,carga_horaria) VALUES ('Fundamentos de SQL', 40);

-- Inserir na tabela turma
INSERT INTO "banco".turma(nome,data_inicio,data_fim,curso) VALUES ('Turma SQL 01','2022-05-10','2022-06-23',1);

SELECT * FROM "banco".aluno;

-- "a" é o apelido para a tabela aluno, para não precisar escrever "banco".aluno, usa-se apenas a de aluno
-- Ordenar seguindo um critério, no caso, pela ordem crescente do nome
SELECT a.matricula,
	   a.nome,
	   a.sexo,
	   a.data_nascimento FROM "banco".aluno a
	   ORDER BY a.nome ASC;
	   
-- Ordenar seguindo um critério, no caso, pela data de nascimento na ordem crescente
SELECT a.matricula,
	   a.nome,
	   a.sexo,
	   a.data_nascimento FROM "banco".aluno a
	   ORDER BY a.data_nascimento ASC;

-- Ordenar seguindo um critério, no caso, pela data de nascimento na ordem decrescente
SELECT a.matricula,
	   a.nome,
	   a.sexo,
	   a.data_nascimento FROM "banco".aluno a
	   ORDER BY a.data_nascimento DESC;
	
-- Dê select apenas nos campos que são necessários dada a situação, para economizar tempo
SELECT a.matricula,
	   a.nome FROM "banco".aluno a;

-- Selecionar um dado especifico, no caso, por matricula
SELECT a.matricula,
	   a.nome,
	   a.sexo,
	   a.data_nascimento FROM "banco".aluno a
	   WHERE a.matricula = 2022501524;

-- Selecionar um dado especifico, no caso, por nome
-- LIKE serve para filtrar por caracteres, por exemplo, M% procura todos os dados onde existe a letra M
SELECT a.matricula,
	   a.nome,
	   a.sexo,
	   a.data_nascimento FROM "banco".aluno a
	   WHERE a.nome LIKE 'M%'
	   ORDER BY a.nome ASC;

SELECT c.nome,
	   c.carga_horaria FROM "banco".curso_fic c;
	   
SELECT t.nome,
	   t.data_inicio,
	   t.data_fim FROM "banco".turma t;