-- d)
SELECT ean
FROM fornece_sec
GROUP BY ean
HAVING count(nif) > 10

-- e)
SELECT ean
FROM reposicao
GROUP BY ean
HAVING count(operador) = 1