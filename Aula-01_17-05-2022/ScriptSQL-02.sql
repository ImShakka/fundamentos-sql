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
	   
-- SELECT com uma expressão condicional
SELECT a.matricula,
	   a.nome,
	   CASE WHEN a.sexo='M' THEN 'Masculino' WHEN a.sexo='F' THEN 'Feminino' END,
	   to_char(a.data_nascimento, 'DD/MM/YYYY') as data_nascimento from "banco".aluno a
	   
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
	   
-- **********************
-- Aula 06 - 02/06/2022
-- **********************

-- **********************************
-- SELECT Relacionamento
-- **********************************

-- Tabela: curso_fic
SELECT c.id, c.nome, c.carga_horaria from "banco".curso_fic c;

UPDATE "banco".curso_fic
SET nome = 'Fundamentos de SQL'
WHERE id=1;

UPDATE "banco".curso_fic
SET nome = 'Programação Web'
WHERE id=2;

-- Tabela: turma
SELECT t.id, t.nome, t.data_inicio, t.data_fim, t.curso from "banco".turma t;

-- Relacionamento entre as tabelas aluno e turma: tabela matriculado

-- Tabela: aluno
SELECT a.matricula, a.nome, a.sexo, to_char(a.data_nascimento, 'DD/MM/YYYY') as data_nascimento from "banco".aluno a ORDER BY a.nome;

-- Tabela: matriculado
SELECT m.id, m.turma, m.aluno from "banco".matriculado m;

-- Fazer a inscrição na tabela matriculado, com os alunos presentes na sala de aula

INSERT INTO "banco".matriculado (turma, aluno) VALUES (1,2022501542);
INSERT INTO "banco".matriculado (turma, aluno) VALUES (1,2022501453);
INSERT INTO "banco".matriculado (turma, aluno) VALUES (1,2022501480);
INSERT INTO "banco".matriculado (turma, aluno) VALUES (1,2022501604);
INSERT INTO "banco".matriculado (turma, aluno) VALUES (1,2022501533);
INSERT INTO "banco".matriculado (turma, aluno) VALUES (1,2022501570);
INSERT INTO "banco".matriculado (turma, aluno) VALUES (1,2022501490);
INSERT INTO "banco".matriculado (turma, aluno) VALUES (1,2022501462);
INSERT INTO "banco".matriculado (turma, aluno) VALUES (1,2022501551);
INSERT INTO "banco".matriculado (turma, aluno) VALUES (1,2022501524);
INSERT INTO "banco".matriculado (turma, aluno) VALUES (1,2022501506);
INSERT INTO "banco".matriculado (turma, aluno) VALUES (1,2022501515);

-- INNER JOIN
-- Tabela curso_fic e turma
-- Listar todos os CURSOS com as suas respectivas TURMAS
SELECT
	c.id as id_curso,
	c.nome,
	c.carga_horaria,
	t.id as id_turma,
	t.nome,
	t.data_inicio,
	t.data_fim,
	t.curso
FROM "banco".curso_fic c
INNER JOIN "banco".turma t ON c.id = t.curso;

-- **********************
-- Aula 07 - 07/06/2022
-- **********************

-- Inserir na tabela: "banco".turma
INSERT INTO "banco".turma (nome,data_inicio,data_fim,curso) VALUES ('Turma Programação Web 01','2022-07-15','2022-08-25',2);

-- **********************
-- LEFT JOIN
-- **********************

-- Tabelas: aluno, matriculado, turma e curso
-- Listar todos os alunos(a)
SELECT 
	a.matricula,
	a.nome as nome_aluno,
	CASE WHEN a.sexo='M' THEN 'Masculino' WHEN a.sexo='F' THEN 'Feminino' END,
	to_char(a.data_nascimento,'DD/MM/YYYY') as data_nascimento,
	t.id as id_turma,
	t.nome as nome_turma,
	t.data_inicio,
	t.data_fim,
	c.id as id_curso,
	c.nome as nome_curso,
	c.carga_horaria
FROM "banco".aluno a
LEFT JOIN "banco".matriculado m ON a.matricula = m.aluno
LEFT JOIN "banco".turma       t ON m.turma     = t.id
LEFT JOIN "banco".curso_fic   c ON t.curso     = c.id
ORDER BY a.nome;

-- Tabelas: aluno, matriculado e turma
-- Listar todas os alunos(a) NÃO matriculado na turma
SELECT 
	a.matricula,
	a.nome as nome_aluno,
	CASE WHEN a.sexo='M' THEN 'Masculino' WHEN a.sexo='F' THEN 'Feminino' END,
	to_char(a.data_nascimento,'DD/MM/YYYY') as data_nascimento,
	t.id as id_turma,
	t.nome as nome_turma,
	t.data_inicio,
	t.data_fim
FROM "banco".aluno a
LEFT OUTER JOIN "banco".matriculado m ON a.matricula = m.aluno -- LEFT OUTER e LEFT é a mesma coisa nessa situação
LEFT OUTER JOIN "banco".turma       t ON m.turma     = t.id    --                  ||                   
WHERE t.id IS NULL -- Indica aluno não matriculado na turma
ORDER BY a.nome;

-- **********************
-- RIGHT JOIN
-- **********************

-- Tabelas: aluno, matriculado e turma
-- Listar todos os alunos(a) matriculados e TODAS as TURMAS
SELECT 
	a.matricula,
	a.nome as nome_aluno,
	CASE WHEN a.sexo='M' THEN 'Masculino' WHEN a.sexo='F' THEN 'Feminino' END,
	to_char(a.data_nascimento,'DD/MM/YYYY') as data_nascimento,
	t.id as id_turma,
	t.nome as nome_turma,
	t.data_inicio,
	t.data_fim,
	t.curso
FROM "banco".aluno a
RIGHT JOIN "banco".matriculado m ON a.matricula = m.aluno
RIGHT JOIN "banco".turma       t ON m.turma     = t.id
ORDER BY a.nome;

-- Tabelas: aluno, matriculado e turma
-- Listar todos os alunos(a) matriculados e NÃO matriculados em TODAS as TURMAS
SELECT 
	a.matricula,
	a.nome as nome_aluno,
	CASE WHEN a.sexo='M' THEN 'Masculino' WHEN a.sexo='F' THEN 'Feminino' END,
	to_char(a.data_nascimento,'DD/MM/YYYY') as data_nascimento,
	t.id as id_turma,
	t.nome as nome_turma,
	t.data_inicio,
	t.data_fim,
	t.curso
FROM "banco".aluno a
FULL JOIN "banco".matriculado m ON a.matricula = m.aluno
FULL JOIN "banco".turma       t ON m.turma     = t.id
ORDER BY a.nome;

-- Tabelas: aluno e turma
-- Listar todos os alunos(a) com as possíveis turmas
-- As turmas que um aluno pode se cadastrar
SELECT 
	a.matricula,
	a.nome as nome_aluno,
	CASE WHEN a.sexo='M' THEN 'Masculino' WHEN a.sexo='F' THEN 'Feminino' END,
	to_char(a.data_nascimento,'DD/MM/YYYY') as data_nascimento,
	t.id as id_turma,
	t.nome as nome_turma,
	t.data_inicio,
	t.data_fim,
	t.curso
FROM "banco".aluno a
CROSS JOIN "banco".turma t
ORDER BY a.nome;

-- *******************
-- Aula 08 - 09/06/2022
-- *******************

SELECT m.id, m.turma, m.aluno
FROM "banco".matriculado m;

-- Inserir na tabela nota
INSERT INTO "banco".nota (nota1, nota2, nota3, matriculado) VALUES (5.5, 7.5, 6.5, 1);
INSERT INTO "banco".nota (nota1, nota2, nota3, matriculado) VALUES (3.5, 4.5, 5.5, 2);
INSERT INTO "banco".nota (nota1, nota2, nota3, matriculado) VALUES (6.2, 5.7, 7.9, 3);
-- Forçando colocar um dado onde é trabalho de um trigger: ele ignora e pega o valor resultado do trigger
INSERT INTO "banco".nota (nota1, nota2, nota3, matriculado, media, situacao) VALUES (3.5, 2.5, 4.5, 4, 9.0, 'H');

SELECT * FROM "banco".nota;

-- aluno matriculado turma nota
SELECT 
	a.matricula,
	a.nome as nome_aluno,
	CASE WHEN a.sexo='M' THEN 'Masculino' WHEN a.sexo='F' THEN 'Feminino' END AS sexo,
	to_char(a.data_nascimento,'DD/MM/YYYY') as data_nascimento,
	t.id as id_turma,
	t.nome as nome_turma,
	t.data_inicio,
	t.data_fim,
	n.nota1,
	n.nota2,
	n.nota3,
	n.media,
	CASE WHEN n.situacao='A' THEN 'Aprovado' WHEN n.situacao='R' THEN 'Reprovado' END AS situacao,
	t.nome as nome_curso
FROM "banco".aluno a
INNER JOIN "banco".matriculado m ON a.matricula = m.aluno
INNER JOIN "banco".turma       t ON t.id        = m.turma
INNER JOIN "banco".nota        n ON n.matriculado  = m.id
ORDER BY a.nome;

-- View 
CREATE VIEW "banco".boletim AS
	SELECT 
		a.matricula,
		a.nome as nome_aluno,
		CASE WHEN a.sexo='M' THEN 'Masculino' WHEN a.sexo='F' THEN 'Feminino' END AS sexo,
		to_char(a.data_nascimento,'DD/MM/YYYY') as data_nascimento,
		t.id as id_turma,
		t.nome as nome_turma,
		t.data_inicio,
		t.data_fim,
		n.nota1,
		n.nota2,
		n.nota3,
		n.media,
		CASE WHEN n.situacao='A' THEN 'Aprovado' WHEN n.situacao='R' THEN 'Reprovado' END AS situacao,
		t.nome as nome_curso
	FROM "banco".aluno a
	INNER JOIN "banco".matriculado m ON a.matricula = m.aluno
	INNER JOIN "banco".turma       t ON t.id        = m.turma
	INNER JOIN "banco".nota        n ON n.matriculado  = m.id
	ORDER BY a.nome;