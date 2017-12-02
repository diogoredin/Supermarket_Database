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