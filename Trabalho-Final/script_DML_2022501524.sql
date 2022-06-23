-- TRABALHO_FIC
-- ARQUIVO DML
-- MATHEUS FERNANDES OLIVEIRA
-- Inserir registros na tabela vendedor
INSERT INTO "banco".vendedor (nome) VALUES ('Ribamar Santos');
INSERT INTO "banco".vendedor (nome) VALUES ('Jonas Silva');
INSERT INTO "banco".vendedor (nome) VALUES ('Ernesto Pereira');
INSERT INTO "banco".vendedor (nome) VALUES ('João Ricardo');
INSERT INTO "banco".vendedor (nome) VALUES ('Priscila Fernandes');

-- Inserir registros na tabela cliente
INSERT INTO "banco".cliente (cpf, nome) VALUES ('54489133006', 'Caio Sevalho');
INSERT INTO "banco".cliente (cpf, nome) VALUES ('07012467070', 'Rafael Augusto');
INSERT INTO "banco".cliente (cpf, nome) VALUES ('63140449011', 'Luis Filipe');
INSERT INTO "banco".cliente (cpf, nome) VALUES ('96938655022', 'Mariana Bezerra');
INSERT INTO "banco".cliente (cpf, nome) VALUES ('02830686047', 'Ana Carolina');


-- Inserir registros na tabela produto
INSERT INTO "banco".produto (descricao, unidade, data_fabricacao, data_validade, quantidade_estoque, preco_compra, preco_venda)
VALUES ('Arroz Integral', '01', '2022-05-12', '2023-04-13', 100, 6.80, 6.70);
INSERT INTO "banco".produto (descricao, unidade, data_fabricacao, data_validade, quantidade_estoque, preco_compra, preco_venda)
VALUES ('Feijão', '01', '2022-02-16', '2023-05-17', 100, 12.90, 12.50);
INSERT INTO "banco".produto (descricao, unidade, data_fabricacao, data_validade, quantidade_estoque, preco_compra, preco_venda)
VALUES ('Biscoito', '01', '2022-03-22', '2024-08-11', 100, 2.50, 2.00);
INSERT INTO "banco".produto (descricao, unidade, data_fabricacao, data_validade, quantidade_estoque, preco_compra, preco_venda)
VALUES ('Chocolate', '01', '2022-01-18', '2024-11-03', 100, 5.50, 5.50);
INSERT INTO "banco".produto (descricao, unidade, data_fabricacao, data_validade, quantidade_estoque, preco_compra, preco_venda)
VALUES ('Refrigerante', '01', '2022-09-27', '2023-10-09', 100, 8.00, 8.00);
INSERT INTO "banco".produto (descricao, unidade, data_fabricacao, data_validade, quantidade_estoque, preco_compra, preco_venda)
VALUES ('Sabão', '01', '2022-06-15', '2025-08-28', 100, 5.00, 5.00);
INSERT INTO "banco".produto (descricao, unidade, data_fabricacao, data_validade, quantidade_estoque, preco_compra, preco_venda)
VALUES ('Macarrão', '01', '2022-08-02', '2023-06-23', 100, 5.70, 5.60);
INSERT INTO "banco".produto (descricao, unidade, data_fabricacao, data_validade, quantidade_estoque, preco_compra, preco_venda)
VALUES ('Pote de Sorvete', '01', '2022-12-01', '2023-04-22', 100, 16.00, 16.00);
INSERT INTO "banco".produto (descricao, unidade, data_fabricacao, data_validade, quantidade_estoque, preco_compra, preco_venda)
VALUES ('Açucar', '01', '2022-11-08', '2024-02-25', 100, 5.50, 5.40);
INSERT INTO "banco".produto (descricao, unidade, data_fabricacao, data_validade, quantidade_estoque, preco_compra, preco_venda)
VALUES ('Trigo', '01', '2022-07-21', '2023-03-27', 100, 4.50, 4.60);

-- Inserir registros na tabela venda
INSERT INTO "banco".venda (data, vendedor, cliente, status) VALUES ('2022-06-21', 1, '54489133006', 'P');
INSERT INTO "banco".venda (data, vendedor, cliente, status) VALUES ('2022-06-20', 2, '07012467070', 'P');
INSERT INTO "banco".venda (data, vendedor, cliente, status) VALUES ('2022-06-19', 3, '63140449011', 'P');

-- Para cada venda, adicionar três itens de venda na tabela item_venda
INSERT INTO "banco".item_venda (quantidade, preco_venda, venda, produto) VALUES (3, 6.70, 1, 1);
INSERT INTO "banco".item_venda (quantidade, preco_venda, venda, produto) VALUES (2, 12.50, 1, 2);
INSERT INTO "banco".item_venda (quantidade, preco_venda, venda, produto) VALUES (4, 2.00, 1, 3);

INSERT INTO "banco".item_venda (quantidade, preco_venda, venda, produto) VALUES (1, 5.50, 2, 4);
INSERT INTO "banco".item_venda (quantidade, preco_venda, venda, produto) VALUES (6, 8.00, 2, 5);
INSERT INTO "banco".item_venda (quantidade, preco_venda, venda, produto) VALUES (5, 5.00, 2, 6);

INSERT INTO "banco".item_venda (quantidade, preco_venda, venda, produto) VALUES (8, 5.60, 3, 7);
INSERT INTO "banco".item_venda (quantidade, preco_venda, venda, produto) VALUES (2, 16.00, 3, 8);
INSERT INTO "banco".item_venda (quantidade, preco_venda, venda, produto) VALUES (2, 5.40, 3, 9);