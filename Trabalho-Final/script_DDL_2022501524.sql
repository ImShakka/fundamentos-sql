-- TRABALHO_FIC
-- ARQUIVO DDL
-- MATHEUS FERNANDES OLIVEIRA
-- Criar Super Usuário
CREATE USER matheus PASSWORD 'shakka' SUPERUSER
INHERIT CREATEDB CREATEROLE;

-- Criar esquema (Schemas)
CREATE SCHEMA IF NOT EXISTS banco;
COMMENT ON SCHEMA banco                           IS 'Criação do Esquema chamado banco que será utilizado no Curso FIC SQL';

-- Atribuir todas as permissões de acesso ao esquema banco para o usuário
GRANT ALL ON SCHEMA banco TO postgres, matheus;

-- *******************
-- Tabela Vendedor
-- *******************

-- Criar seq_id do Vendedor
CREATE SEQUENCE "banco".vendedor_seq_id;
COMMENT ON SEQUENCE "banco".vendedor_seq_id      IS 'Usado para gerar as chaves primárias da tabela vendedor automaticamente';

-- Criar tabela: vendedor
CREATE TABLE "banco".vendedor (
	id int DEFAULT nextval('"banco".vendedor_seq_id') NOT NULL,
	nome varchar(50) NOT NULL,
	CONSTRAINT pk_vendedor_id PRIMARY KEY(id)
);

COMMENT ON TABLE  "banco".vendedor               IS 'Representa a entidade vendedor';
COMMENT ON COLUMN "banco".vendedor.id            IS 'Chave primária';
COMMENT ON COLUMN "banco".vendedor.nome          IS 'Nome do vendedor';

CREATE INDEX vendedor_index_nome ON "banco".vendedor(nome);
COMMENT ON INDEX "banco".vendedor_index_nome     IS 'A entidade vendedor é ordenada pelo campo nome';

-- *******************
-- Tabela Cliente
-- *******************

-- Criar tabela: cliente
CREATE TABLE "banco".cliente (
    cpf varchar(11)  NOT NULL,
	nome varchar(50) NOT NULL,
	CONSTRAINT pk_cliente_cpf PRIMARY KEY(cpf)
);

COMMENT ON TABLE  "banco".cliente               IS 'Representa a entidade cliente';
COMMENT ON COLUMN "banco".cliente.cpf           IS 'CPF do cliente';
COMMENT ON COLUMN "banco".cliente.nome          IS 'Nome do cliente';

CREATE INDEX cliente_index_nome ON "banco".cliente(nome);
COMMENT ON INDEX "banco".cliente_index_nome     IS 'A entidade cliente é ordenada pelo campo nome';


-- *******************
-- Tabela Venda
-- *******************

-- Criar um dominio para o campo status, para o banco aceitar somente [P] ou [F]
CREATE DOMAIN "banco".dominio_status AS char(1) NOT NULL CONSTRAINT venda_status_check CHECK (VALUE IN ('P', 'F'));
COMMENT ON DOMAIN "banco".dominio_status            IS 'Dominio criado para o campo status da entidade Venda. [P] - Pedido, [F] - Faturado';

-- Criar seq_id da tabela venda
CREATE SEQUENCE "banco".venda_seq_id;
COMMENT ON SEQUENCE "banco".venda_seq_id      IS 'Usado para gerar as chaves primárias da tabela venda automaticamente';

-- Criar tabela venda
CREATE TABLE "banco".venda (
	id int DEFAULT nextval('"banco".venda_seq_id') NOT NULL,
	data date NOT NULL,
	vendedor int NOT NULL,
	cliente varchar(11) NOT NULL,
    status "banco".dominio_status,
	CONSTRAINT pk_venda_id PRIMARY KEY(id),
	CONSTRAINT fk_venda_vendedor FOREIGN KEY(vendedor)  REFERENCES "banco".vendedor(id),
    CONSTRAINT fk_venda_cliente FOREIGN KEY(cliente)  REFERENCES "banco".cliente(cpf),
	CONSTRAINT unique_cpf_vendedor_cliente UNIQUE (vendedor, cliente)
);

COMMENT ON TABLE  "banco".venda             IS 'Representa todas as vendas';
COMMENT ON COLUMN "banco".venda.id          IS 'Chave Primária';
COMMENT ON COLUMN "banco".venda.data        IS 'Representa a data da venda';
COMMENT ON COLUMN "banco".venda.vendedor    IS 'Chave estrangeira que indentifica o vendedor da venda';
COMMENT ON COLUMN "banco".venda.cliente     IS 'Chave estrangeira que indentifica o cliente da venda';
COMMENT ON COLUMN "banco".venda.status      IS 'Representa o status da venda';

-- *******************
-- Tabela produto
-- *******************

-- Criar seq_id da tabela produto
CREATE SEQUENCE "banco".produto_seq_id;
COMMENT ON SEQUENCE "banco".produto_seq_id      IS 'Usado para gerar a chaves primária id da tabela produto automaticamente';

-- Criar tabela produto
CREATE TABLE "banco".produto (
	id int DEFAULT nextval('"banco".produto_seq_id') NOT NULL,
	descricao varchar(100) NOT NULL,
	unidade varchar(2) NOT NULL,
	data_fabricacao date NOT NULL,
    data_validade date NOT NULL,
	quantidade_estoque real NOT NULL,
    preco_compra real NOT NULL,
    preco_venda real NOT NULL,
	CONSTRAINT pk_produto_id PRIMARY KEY(id)
);

COMMENT ON TABLE  "banco".produto                    IS 'Representa todos os produtos de uma venda';
COMMENT ON COLUMN "banco".produto.id                 IS 'Chave Primária';
COMMENT ON COLUMN "banco".produto.descricao          IS 'Representa a descrição de um produto';
COMMENT ON COLUMN "banco".produto.unidade            IS 'Representa a unidade de um produto';
COMMENT ON COLUMN "banco".produto.data_fabricacao    IS 'Representa a data de fabricação de um produto';
COMMENT ON COLUMN "banco".produto.data_validade      IS 'Representa a data de validade de um produto';
COMMENT ON COLUMN "banco".produto.quantidade_estoque IS 'Representa a quantidade de estoque de um produto';
COMMENT ON COLUMN "banco".produto.preco_compra       IS 'Representa o preco de compra de um produto';
COMMENT ON COLUMN "banco".produto.preco_venda        IS 'Representa o preço de venda de um produto';

-- *******************
-- Tabela item_venda
-- *******************

-- Criar seq_id da tabela item_venda
CREATE SEQUENCE "banco".item_venda_seq_id;
COMMENT ON SEQUENCE "banco".item_venda_seq_id      IS 'Usado para gerar a chaves primária da tabela item_venda automaticamente';

-- Criar tabela item_venda
CREATE TABLE "banco".item_venda (
	id int DEFAULT nextval('"banco".item_venda_seq_id') NOT NULL,
	quantidade real NOT NULL,
	preco_venda real NOT NULL,
	total_item real,
	venda int NOT NULL,
    produto int NOT NULL,
	CONSTRAINT pk_item_venda_id PRIMARY KEY(id),
	CONSTRAINT fk_item_venda_venda FOREIGN KEY(venda)  REFERENCES "banco".venda(id),
    CONSTRAINT fk_item_venda_produto FOREIGN KEY(produto) REFERENCES "banco".produto(id)
);

COMMENT ON TABLE  "banco".item_venda                  IS 'Representa todas os itens de venda de uma venda';
COMMENT ON COLUMN "banco".item_venda.id               IS 'Chave Primária';
COMMENT ON COLUMN "banco".item_venda.quantidade       IS 'Representa a quantidade do item_venda';
COMMENT ON COLUMN "banco".item_venda.preco_venda      IS 'Representa o preço do item_venda';
COMMENT ON COLUMN "banco".item_venda.total_item       IS 'Representa o preço total do item_venda';
COMMENT ON COLUMN "banco".item_venda.venda            IS 'Chave estrangeira que indentifica a venda de item_venda';
COMMENT ON COLUMN "banco".item_venda.produto          IS 'Chave estrangeira que indentifica o produto de item_venda';

-- Trigger calcular valor do campo total_item

CREATE OR REPLACE FUNCTION "banco".determinar_total_item()
RETURNS TRIGGER AS 
$BODY$
DECLARE
    total REAL;
	BEGIN
        SELECT total_item FROM "banco".item_venda WHERE id = NEW.id INTO total;
        UPDATE "banco".item_venda SET total_item = NEW.quantidade * NEW.preco_venda::numeric
        WHERE id = NEW.id;
		RETURN NEW;
	END;
$BODY$ LANGUAGE plpgsql;

COMMENT ON FUNCTION "banco".determinar_total_item IS 'Função da trigger para calcular o valor total de item_venda';

CREATE TRIGGER det_total_item AFTER INSERT OR UPDATE ON "banco".item_venda
FOR EACH ROW WHEN (pg_trigger_depth() = 0) EXECUTE PROCEDURE "banco".determinar_total_item();

-- Trigger calcular valor do campo quantidade_estoque

CREATE OR REPLACE FUNCTION "banco".determinar_quantidade_estoque() 
RETURNS TRIGGER AS
$BODY$
DECLARE
    qtde REAL;
	BEGIN
        SELECT quantidade_estoque FROM "banco".produto WHERE id = NEW.id INTO qtde;
        IF qtde < NEW.quantidade THEN
            RAISE EXCEPTION 'quantidade indisponivel no estoque.';
        ELSE
            UPDATE "banco".produto SET quantidade_estoque = quantidade_estoque - NEW.quantidade
            WHERE id = NEW.id;
        END IF;
        RETURN NEW;
	END;
$BODY$ LANGUAGE plpgsql;

COMMENT ON FUNCTION "banco".determinar_quantidade_estoque IS 'Função da trigger para calcular o valor do campo quantidade_estoque';

CREATE TRIGGER atualiza_estoque AFTER INSERT ON "banco".item_venda
FOR EACH ROW EXECUTE PROCEDURE "banco".determinar_quantidade_estoque();

-- Trigger atualizar campo quantidade_estoque da tabela produto quando é deletado um item da tabela item_venda

CREATE OR REPLACE FUNCTION "banco".del_determinar_quantidade_estoque() 
RETURNS TRIGGER AS
$BODY$
DECLARE
    qtde INTEGER;
	BEGIN
        SELECT quantidade_estoque FROM "banco".produto WHERE id = NEW.id INTO qtde;
        IF qtde < NEW.quantidade THEN
            RAISE EXCEPTION 'quantidade indisponivel no estoque.';
        ELSE
            UPDATE "banco".produto SET quantidade_estoque = quantidade_estoque + NEW.quantidade
                WHERE id = NEW.id;
        END IF;
        RETURN NEW;
	END;
$BODY$ LANGUAGE plpgsql;

COMMENT ON FUNCTION "banco".del_determinar_quantidade_estoque IS 'Função da trigger para calcular o valor do campo quantidade_estoque';

CREATE TRIGGER atualiza_estoque_del AFTER DELETE ON "banco".item_venda
FOR EACH ROW EXECUTE PROCEDURE "banco".del_determinar_quantidade_estoque();

-- View 
CREATE VIEW "banco".compras AS
	SELECT
    c.cpf as cpf_cliente,
    c.nome as nome_cliente,
    vendedor.nome as nome_vendedor,
	v.data as data_venda,
    p.descricao,
    p.unidade,
    p.data_fabricacao,
    p.data_validade,
    iv.quantidade,
    iv.preco_venda,
    iv.total_item 
FROM "banco".produto p
LEFT OUTER JOIN "banco".item_venda iv ON p.id = iv.produto
LEFT OUTER JOIN "banco".venda v ON iv.venda = v.id
LEFT OUTER JOIN "banco".vendedor vendedor ON v.vendedor = vendedor.id
LEFT OUTER JOIN "banco".cliente c ON v.cliente = c.cpf
WHERE iv.venda IS NOT NULL;

COMMENT ON VIEW "banco".compras IS 'View para mostrar as compras';