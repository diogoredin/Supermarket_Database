----------------------------------------
-- Queries
----------------------------------------

-- b)
SELECT f.nome, f.nif
FROM fornecedor f, produto p, categoria_simples c
WHERE p.categoria = c.nome and p.fornecedor = f.nif;

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