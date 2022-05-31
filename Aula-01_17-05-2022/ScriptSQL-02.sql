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
-- O caractere % é um coringa, significa qualquer quantidade de caracteres digitados com %
-- Exemplo: M% qualquer variavel que tenha M no inicio 
-- Exemplo: %M qualquer variavel que tenha M no fim
-- Exemplo: %M% qualquer variavel que tenha M em qualquer lugar 
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
	   

-- **********************
-- Aula 05 - 31/05/2022
-- **********************

-- Exemplo Instrução DQL

-- Pode associar um apelido para cada caluna para visualizar os dados
SELECT a.matricula       as Matricula,
	   a.nome            as Nome,
	   a.sexo            as Sexo,
	   a.data_nascimento as Data_de_Nascimento from "banco".aluno a;

-- Procurar por valores terminados em LINS
SELECT a.matricula,
	   a.nome,
	   a.sexo,
	   a.data_nascimento FROM "banco".aluno a
	   WHERE a.nome LIKE '%LINS'
	   ORDER BY a.nome ASC;

-- Procurar por valores que contenham AN
SELECT a.matricula,
	   a.nome,
	   a.sexo,
	   a.data_nascimento FROM "banco".aluno a
	   WHERE a.nome LIKE '%AN%'
	   ORDER BY a.nome ASC;

-- O caractere _ é um coringa, que representa uma letra e precisa ser exatamente naquela posicao
-- O caractere % é um coringa, que representa um conjunto de caractere que nao interessa quantidade de caractere
-- Seleciona todos os registros não importa a PRIMEIRA LETRA _ e a partir do segundo, que contenha A e nao importa o que venha depois
SELECT a.matricula,
	   a.nome,
	   a.sexo,
	   a.data_nascimento FROM "banco".aluno a
	   WHERE a.nome LIKE '_A%'
	   ORDER BY a.nome ASC;
	   
-- Cláusula ILIKE ( não é case-sensitive) filtra caracteres de forma universal, independente se os caracteres sao maiusculos ou minusculos
SELECT a.matricula,
	   a.nome,
	   a.sexo,
	   a.data_nascimento FROM "banco".aluno a
	   WHERE a.nome ILIKE '%PEDRO%'
	   ORDER BY a.nome ASC;

SELECT a.matricula,
	   a.nome,
	   a.sexo,
	   a.data_nascimento FROM "banco".aluno a
	   WHERE a.nome ILIKE '%pedro%'
	   ORDER BY a.nome ASC;
	   
-- **************************

-- Tipo Data
-- to_char: converte um tipo data em caractere segundo uma formatação

SELECT a.matricula,
	   a.nome,
	   a.sexo,
	   to_char(a.data_nascimento, 'DD/MM/YYYY') as data_nascimento from "banco".aluno a;
	   
-- Converte o tipo data em caractere: dia, mês e ano
SELECT a.matricula,
       a.nome,
	   a.sexo,
	   to_char(a.data_nascimento, 'DD') as Dia,
	   to_char(a.data_nascimento, 'MM') as Mes,
	   to_char(a.data_nascimento, 'YYYY') as Ano from "banco".aluno a;

-- Extrai o dia, mês e ano como numérico
SELECT a.matricula,
       a.nome,
	   a.sexo,
	   EXTRACT('Day' from a.data_nascimento) as Dia,
	   EXTRACT('Month' from a.data_nascimento) as Mes,
	   EXTRACT('Year' from a.data_nascimento) as Ano from "banco".aluno a;

-- Apenas os alunos que nasceram em 1998 ou 1999
SELECT a.matricula,
       a.nome,
	   a.sexo,
	   EXTRACT('Day' from a.data_nascimento) as Dia,
	   EXTRACT('Month' from a.data_nascimento) as Mes,
	   EXTRACT('Year' from a.data_nascimento) as Ano from "banco".aluno a
	   WHERE EXTRACT('Year' from a.data_nascimento) IN (1998,1999)
	   ORDER BY a.nome ASC;

-- Apenas os alunos que nasceram entre 2000 e 2010
SELECT a.matricula,
       a.nome,
	   a.sexo,
	   EXTRACT('Day' from a.data_nascimento) as Dia,
	   EXTRACT('Month' from a.data_nascimento) as Mes,
	   EXTRACT('Year' from a.data_nascimento) as Ano from "banco".aluno a
	   WHERE EXTRACT('Year' from a.data_nascimento) BETWEEN 2000 AND 2010
	   ORDER BY a.nome ASC;

-- Ordenar os alunos por idade crescente
-- Invés de current_date, também existe o now() porém ele pega as horas também além da data atual
SELECT a.matricula,
	   a.nome,
	   a.sexo,
	   to_char(a.data_nascimento, 'DD/MM/YYYY') as data_nascimento,
	   EXTRACT('Year' from current_date) - EXTRACT('Year' from a.data_nascimento) as idade from "banco".aluno a
	   ORDER BY idade ASC;

-- Ordenar os alunos por idade crescente utilizando a função age
SELECT a.matricula,
	   a.nome,
	   a.sexo,
	   to_char(a.data_nascimento, 'DD/MM/YYYY') as data_nascimento,
	   age(current_date, a.data_nascimento) as idade from "banco".aluno a
	   ORDER BY idade ASC;

-- Determinar a quantidade de registros na tabela
SELECT COUNT(a.matricula) Quantidade_Registro from "banco".aluno a

-- Selecionar a MENOR idade
SELECT MIN (EXTRACT('Year' from current_date) - EXTRACT('Year' from a.data_nascimento)) as menor_idade from "banco".aluno a

-- Selecionar a MAIOR idade
SELECT MAX (EXTRACT('Year' from current_date) - EXTRACT('Year' from a.data_nascimento)) as maior_idade from "banco".aluno a

-- SELECT de SELECT: MENOR idade
SELECT a.matricula,
	   a.nome,
	   a.sexo,
	   to_char(a.data_nascimento, 'DD/MM/YYYY') as data_nascimento,
	   EXTRACT('Year' from age(current_date, a.data_nascimento)) as idade from "banco".aluno a
	   WHERE EXTRACT('Year' from age(current_date, a.data_nascimento)) =
	   (SELECT MIN(EXTRACT('Year' from age(current_date, a.data_nascimento))) as menor_idade from "banco".aluno a)
	   ORDER BY a.nome ASC;
	   
SELECT a.matricula,
	   a.nome,
	   a.sexo,
	   to_char(a.data_nascimento, 'DD/MM/YYYY') as data_nascimento,
	   EXTRACT('Year' from age(current_date, a.data_nascimento)) as idade from "banco".aluno a
	   WHERE EXTRACT('Year' from age(current_date, a.data_nascimento)) =
	   (SELECT MAX(EXTRACT('Year' from age(current_date, a.data_nascimento))) as maior_idade from "banco".aluno a)
	   ORDER BY a.nome ASC;