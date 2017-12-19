----------------------------------------
-- Queries
----------------------------------------
-- a)
SELECT nome
FROM
    (SELECT DISTINCT categoria, fornecedor as nif FROM produto
            UNION
    SELECT DISTINCT categoria, nif FROM fornece_sec NATURAL JOIN produto) as cats NATURAL JOIN fornecedor
GROUP BY nif, nome
HAVING count(categoria) >= ALL(
    SELECT count(categoria)
    FROM
        (SELECT DISTINCT categoria, fornecedor as nif FROM produto
                UNION
        SELECT DISTINCT categoria, nif FROM fornece_sec NATURAL JOIN produto) as cats
    GROUP BY nif);

-- b)
SELECT f.nome, f.nif
FROM fornecedor f, produto p, categoria_simples c
WHERE p.categoria = c.nome and p.fornecedor = f.nif;

-- c)
SELECT ean 
FROM produto
EXCEPT
SELECT ean
FROM produto NATURAL JOIN reposicao;

-- d) 
SELECT ean
FROM fornece_sec
GROUP BY ean
HAVING count(nif) > 10;

-- e)
SELECT ean
FROM reposicao
GROUP BY ean
HAVING count(operador) = 1;

-- OLAP Query
SELECT *
FROM (
(SELECT count(*), categoria, ano, mes
FROM fact_table NATURAL JOIN d_produto
WHERE nif_fornecedor_principal = 123455678
GROUP BY categoria, ano, mes)
UNION
(SELECT count(*), categoria, ano, null as mes
FROM fact_table NATURAL JOIN d_produto
WHERE nif_fornecedor_principal = 123455678
GROUP BY categoria, ano)
UNION
(SELECT count(*), categoria, null as ano, null as mes
FROM fact_table NATURAL JOIN d_produto
WHERE nif_fornecedor_principal = 123455678
GROUP BY categoria)) as roll;