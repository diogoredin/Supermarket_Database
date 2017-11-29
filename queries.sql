----------------------------------------
-- Queries
----------------------------------------
-- a)


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