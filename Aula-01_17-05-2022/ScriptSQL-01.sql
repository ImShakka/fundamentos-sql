-- SGBD Server : PostgreSQL
-- Cliente     : pgAdmin
-- Script      : ScriptSQL-01.sql

-- Aula 01 - 17/05/2022

-- Exemplo de Instrução DDL

-- Criar Super Usuário
CREATE USER matheus PASSWORD 'shakka' SUPERUSER
INHERIT CREATEDB CREATEROLE;

-- Exemplo de instrução DDL
-- Criar esquema (Schemas)
CREATE SCHEMA IF NOT EXISTS banco;
COMMENT ON SCHEMA banco                           IS 'Criação do Esquema chamado banco que será utilizado no Curso FIC SQL';

-- Exemplo de instrução DCL
-- Atribuir todas as permissões de acesso ao esquema banco para o usuário
GRANT ALL ON SCHEMA banco TO postgres, matheus;

-- Criar seq_id do Curso FIC
CREATE SEQUENCE "banco".curso_fic_seq_id;
COMMENT ON SEQUENCE "banco".curso_fic_seq_id      IS 'Usado para gerar as chaves primárias automaticamente';


-- *******************
-- Tabela Curso FIC
-- *******************

-- Criar tabela: curso_fic
CREATE TABLE "banco".curso_fic (
	id int DEFAULT nextval('"banco".curso_fic_seq_id') NOT NULL,
	nome varchar(50) NOT NULL,
	carga_horaria int NOT NULL,
	CONSTRAINT pk_id PRIMARY KEY(id)
);
COMMENT ON TABLE  "banco".curso_fic               IS 'Representa a entidade curso fic';
COMMENT ON COLUMN "banco".curso_fic.id            IS 'Chave primária';
COMMENT ON COLUMN "banco".curso_fic.nome          IS 'Nome do curso FIC';
COMMENT ON COLUMN "banco".curso_fic.carga_horaria IS 'Carga horária total do curso FIC';

CREATE INDEX curso_fic_index_nome ON "banco".curso_fic(nome);
COMMENT ON INDEX "banco".curso_fic_index_nome     IS 'A entidade Curso FIC é ordenada pelo campo nome';

-- Inserir na tabela: "banco".curso_fic
INSERT INTO "banco".curso_fic(nome, carga_horaria) VALUES ('Curso Fundamentos de SQL', 40);

-- Visualizar os dados inseridos
SELECT * FROM "banco".curso_fic;

-- *******************
-- Tabela Aluno - Aula 02
-- *******************

-- Criar um dominio para o campo sexo, para o banco aceitar somente [M] ou [F]
CREATE DOMAIN "banco".dominio_sexo AS char(1) NOT NULL CONSTRAINT aluno_sexo_check CHECK (VALUE IN ('M', 'F'));
COMMENT ON DOMAIN "banco".dominio_sexo            IS 'Dominio criado para o campo sexo da entidade Aluno. [M] - Masculino, [F] - Feminino';

-- Criar Tabela Aluno
CREATE TABLE "banco".aluno (
	matricula int NOT NULL,
	nome varchar(50) NOT NULL,
	sexo "banco".dominio_sexo,
	data_nascimento date NOT NULL,
	CONSTRAINT pk_aluno_matricula PRIMARY KEY(matricula)
);

COMMENT ON TABLE  "banco".aluno                   IS 'Representa a entidade Aluno';
COMMENT ON COLUMN "banco".aluno.matricula         IS 'Chave Primária';
COMMENT ON COLUMN "banco".aluno.nome              IS 'Nome do aluno';
COMMENT ON COLUMN "banco".aluno.sexo              IS 'Sexo do aluno. [M] - Masculino, [F] - Feminino';
COMMENT ON COLUMN "banco".aluno.data_nascimento   IS 'Data de nascimento do aluno';

-- Criar indice para a tabela aluno
CREATE INDEX aluno_index_nome ON "banco".aluno(nome);
COMMENT ON INDEX "banco".aluno_index_nome         IS 'A entidade Aluno está ordenada pelo campo nome do aluno';

-- Inserir na tabela: "banco".aluno
INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES ('2019008007', 'Matheus Fernandes', 'M', '27/07/2001');

-- Visualizar os dados inseridos
SELECT * FROM "banco".aluno;