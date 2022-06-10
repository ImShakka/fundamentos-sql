-- SGBD Server : PostgreSQL
-- Cliente     : pgAdmin
-- Script      : ScriptSQL-01.sql

-- ************************
-- Aula 01 - 17/05/2022
-- ************************

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
-- Aula 02 - 19/05/2022
-- *******************

-- *******************
-- Tabela Aluno
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
COMMENT ON COLUMN "banco".aluno.sexo              IS 'Sexo do aluno: [M] - Masculino, [F] - Feminino';
COMMENT ON COLUMN "banco".aluno.data_nascimento   IS 'Data de nascimento do aluno';

-- Criar indice para a tabela aluno
CREATE INDEX aluno_index_nome ON "banco".aluno(nome);
COMMENT ON INDEX "banco".aluno_index_nome         IS 'A entidade Aluno está ordenada pelo campo nome do aluno';

-- Inserir na tabela: "banco".aluno
INSERT INTO "banco".aluno(matricula, nome, sexo, data_nascimento) VALUES ('2019008007', 'Matheus Fernandes', 'M', '27/07/2001');

-- Visualizar os dados inseridos
SELECT * FROM "banco".aluno;

-- *******************
-- Aula 03 - 24/05/2022
-- *******************

-- *******************
-- Tabela Turma
-- *******************

-- Criar seq_id da tabela turma
CREATE SEQUENCE "banco".turma_fic_seq_id;
COMMENT ON SEQUENCE "banco".turma_fic_seq_id      IS 'Usado para gerar a chaves primária id da tabela turma automaticamente';

-- Criar tabela turma
CREATE TABLE "banco".turma (
	id int DEFAULT nextval('"banco".turma_fic_seq_id') NOT NULL,
	nome varchar(50) NOT NULL,
	data_inicio date NOT NULL,
	data_fim date NOT NULL,
	curso int NOT NULL,
	CONSTRAINT pk_turma_id PRIMARY KEY(id),
	CONSTRAINT fk_turma_curso FOREIGN KEY(curso)  REFERENCES "banco".curso_fic(id)
);

COMMENT ON TABLE  "banco".turma                   IS 'Representa a entidade Turma';
COMMENT ON COLUMN "banco".turma.id                IS 'Chave Primária';
COMMENT ON COLUMN "banco".turma.nome              IS 'Nome da Turma';
COMMENT ON COLUMN "banco".turma.data_inicio       IS 'A data início do curso da turma';
COMMENT ON COLUMN "banco".turma.data_fim          IS 'A data fim do curso da Turma';
COMMENT ON COLUMN "banco".turma.curso             IS 'Identifica o curso da turma';

CREATE INDEX turma_index_nome ON "banco".turma(nome);
COMMENT ON INDEX "banco".turma_index_nome         IS 'A entidade Turma está ordenada pelo campo nome da turma';

-- *******************
-- Tabela Matriculado
-- *******************

-- Criar seq_id da tabela matriculado
CREATE SEQUENCE "banco".matriculado_seq_id;
COMMENT ON SEQUENCE "banco".matriculado_seq_id    IS 'Usado para gerar a chaves primária id da tabela matriculado automaticamente';

-- Criar tabela matriculado
CREATE TABLE "banco".matriculado (
	id int DEFAULT nextval('"banco".matriculado_seq_id') NOT NULL,
	turma int NOT NULL,
	aluno int NOT NULL,
	CONSTRAINT pk_matriculado_id PRIMARY KEY(id),
	CONSTRAINT fk_matriculado_turma FOREIGN KEY(turma)  REFERENCES "banco".turma(id),
	CONSTRAINT fk_matriculado_aluno FOREIGN KEY(aluno)  REFERENCES "banco".aluno(matricula),
	CONSTRAINT unique_matriculado_turma_aluno UNIQUE (turma, aluno)
);

COMMENT ON TABLE  "banco".matriculado             IS 'Representa todos os alunos matriculados em um determinado curso FIC';
COMMENT ON COLUMN "banco".matriculado.id          IS 'Chave Primária';
COMMENT ON COLUMN "banco".matriculado.turma       IS 'Chave estrangeira que indentifica a turma do curso FIC';
COMMENT ON COLUMN "banco".matriculado.aluno       IS 'Chave estrangeira que indentifica o aluno do curso FIC';


-- *******************
-- Tabela Nota
-- *******************

-- Criar seq_id da tabela nota
CREATE SEQUENCE "banco".nota_seq_id;
COMMENT ON SEQUENCE "banco".nota_seq_id           IS 'Usada para gerar a chave primária id da tabela nota automaticamente';

-- Criar um dominio para o campo Situação, onde o aluno pode estar [A] - Aprovado ou [R] - Reprovado
CREATE DOMAIN "banco".dominio_situacao AS char(1) NOT NULL CONSTRAINT aluno_situacao_check CHECK (VALUE IN ('A', 'R'));
COMMENT ON DOMAIN "banco".dominio_situacao        IS 'Dominio criado para o campo situacao do aluno. [A] - Aprovado, [R] - Reprovado';

-- Criar tabela nota
CREATE TABLE "banco".nota (
	id int DEFAULT nextval('"banco".nota_seq_id') NOT NULL,
	nota1 decimal(2,2) NOT NULL,
	nota2 decimal(2,2) NOT NULL,
	nota3 decimal(2,2) NOT NULL,
	situacao "banco".dominio_situacao,
	matriculado int NOT NULL,
	CONSTRAINT pk_nota_id PRIMARY KEY(id),
	CONSTRAINT fk_nota_matriculado FOREIGN KEY(matriculado) REFERENCES "banco".matriculado(id)
);

COMMENT ON TABLE "banco".nota                     IS 'Representa as notas dos alunos matriculados em um determinado curso FIC';
COMMENT ON COLUMN "banco".nota.id                 IS 'Chave Primária';
COMMENT ON COLUMN "banco".nota.nota1              IS 'Primeira nota do aluno';
COMMENT ON COLUMN "banco".nota.nota2              IS 'Segunda nota do aluno';
COMMENT ON COLUMN "banco".nota.nota3              IS 'Terceira nota do aluno';
COMMENT ON COLUMN "banco".nota.situacao           IS 'Indica a situação do aluno: [A] - Aprovado, [R] - Reprovado';

-- *******************
-- Aula 08 - 09/06/2022
-- *******************

-- *******************
-- Tabela Nota - Forma de fazer a situação sem Dominio (forma atual do banco 09/06/2022)
-- *******************

-- Criar seq_id da tabela nota
CREATE SEQUENCE "banco".nota_seq_id;
COMMENT ON SEQUENCE "banco".nota_seq_id           IS 'Usada para gerar a chave primária id da tabela nota automaticamente';

-- Criar tabela nota
CREATE TABLE "banco".nota (
	id int DEFAULT nextval('"banco".nota_seq_id') NOT NULL,
	nota1 real NOT NULL,
	nota2 real NOT NULL,
	nota3 real NOT NULL,
	media real,
	situacao varchar(1),
	matriculado int NOT NULL,
	CONSTRAINT pk_nota_id PRIMARY KEY(id),
	CONSTRAINT fk_nota_matriculado FOREIGN KEY(matriculado) REFERENCES "banco".matriculado(id)
);

COMMENT ON TABLE "banco".nota                     IS 'Representa as notas dos alunos matriculados em um determinado curso FIC';
COMMENT ON COLUMN "banco".nota.id                 IS 'Chave Primária';
COMMENT ON COLUMN "banco".nota.nota1              IS 'Primeira nota do aluno';
COMMENT ON COLUMN "banco".nota.nota2              IS 'Segunda nota do aluno';
COMMENT ON COLUMN "banco".nota.nota3              IS 'Terceira nota do aluno';
COMMENT ON COLUMN "banco".nota.media              IS 'Média do aluno';
COMMENT ON COLUMN "banco".nota.situacao           IS 'Indica a situação do aluno: [A] - Aprovado, [R] - Reprovado';

-- Trigger: Dispara um evento na tabela
-- Toda trigger é associada a uma tabela e precisa ter uma ação, sendo uma FUNCTION
CREATE FUNCTION "banco".determinar_media_situacao()
RETURNS TRIGGER AS 
$BODY$
	BEGIN
		NEW.media = (NEW.nota1 + NEW.nota2 + NEW.nota3) / 3.0;
		IF (NEW.media >= 6.0) THEN NEW.situacao := 'A';
		ELSE NEW.situacao := 'R';
		END IF;
		RETURN NEW;
	END;
$BODY$ LANGUAGE plpgsql;

COMMENT ON FUNCTION "banco".determinar_media_situacao IS 'Função da trigger para calcular a média e determinar a situação do aluno'