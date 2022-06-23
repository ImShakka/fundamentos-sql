-- TRABALHO_FIC
-- ARQUIVO DQL
-- MATHEUS FERNANDES OLIVEIRA
-- Listar todos os campos da tabela produto que foram vendidos
SELECT 
	p.descricao,
    p.unidade,
    p.data_fabricacao,
    p.data_validade,
    p.quantidade_estoque,
    p.preco_compra,
    p.preco_venda
FROM "banco".produto p
RIGHT JOIN "banco".item_venda iv ON p.id = iv.produto

-- Exibir todos os clientes que não fizeram compras
SELECT 
    c.cpf,
	c.nome as nome_cliente,
	v.id as id_venda,
	v.data as data_venda,
    v.status,
	v.vendedor
FROM "banco".cliente c
LEFT OUTER JOIN "banco".venda v ON c.cpf = v.cliente
WHERE v.cliente IS NULL
ORDER BY c.nome;

-- Exibir todas as vendas com os itens de venda para cada vendedor
SELECT 
    vendedor.id,
    vendedor.nome as nome_vendedor,
	v.data as data_venda,
	v.status,
    p.descricao,
    p.unidade,
    p.data_fabricacao,
    p.data_validade,
    iv.quantidade,
    iv.preco_venda,
    iv.total_item 
FROM "banco".produto p
LEFT JOIN "banco".item_venda iv ON p.id = iv.produto
LEFT JOIN "banco".venda v ON iv.venda = v.id
LEFT JOIN "banco".vendedor vendedor ON v.vendedor = vendedor.id;